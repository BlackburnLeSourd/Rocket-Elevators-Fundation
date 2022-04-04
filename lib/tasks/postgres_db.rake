require "faker"
require 'date'
task spec: ['postgres:db:test:prepare']

namespace :postgres do
  namespace :db do |ns|
    %i(drop create setup migrate rollback seed version).each do |task_name|
      task task_name do
        Rake::Task["db:#{task_name}"].invoke
      end
    end

    namespace :schema do
      %i(load dump).each do |task_name|
        task task_name do
          Rake::Task["db:schema:#{task_name}"].invoke
        end
      end
    end

    namespace :import do
      desc "Import fact_quotes data from MYSQL"
      task fact_quotes: :environment do
        FactQuote.destroy_all
        count = 0
        Quote.find_each do |record|
          fq = FactQuote.new
          fq.quoteId = record.id
          fq.companyName = record.companyName
          fq.email = record.email
          fq.nbElevator = record.no_of_elevators_needed
          fq.createdOn = Time.at(record.created_at).to_datetime
          if fq.save
            puts "fact_quotes saved"
            count = count + 1
          else
            puts "... bad: #{u.errors.full_messages.join(',')}"
          end
        end
        puts "#{count} fact_quotes saved."
      end

      desc "Import fact_interventions data from MYSQL"
      task fact_interventions: :environment do
         FactIntervention.destroy_all
        count = 0
        20.times do |record|
          fi = FactIntervention.new
          fi.employeeID = Faker::Number.between(from: 1, to: 25) 
          fi.buildingID = Building.find(Building.pluck(:id).sample).id
          battery = Battery.where(building_id: fi.buildingID).first
          if battery != nil
              fi.batteryID = battery.id
          else
            fi.batteryID = nil
          end
          column = Column.where(battery_id: fi.batteryID).first
          if column != nil
              fi.columnID = column.id
          else 
            fi.columnID = nil
          end
          elevator = Elevator.where(column_id: fi.columnID).first
          if elevator != nil
              fi.elevatorID = elevator.id
          else
            fi.elevatorID = nil
          end
          fi.start_Date_And_Time_Of_the_Intervention = Faker::Date.between(from: '2018-09-23', to: '2021-09-25') 
          fi.end_Date_And_Time_Of_The_Intervention = Faker::Date.between(from: '2021-09-26', to: '2022-03-25') 
          fi.result = ["Success"," Failure ","Incomplete"].sample
          fi.report = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
          fi.status = ["Pending "," InProgress "," Interrupted "," Resumed "," Complete"].sample
          if fi.save
            count = count + 1
          else
            puts "... bad: #{u.errors.full_messages.join(',')}"
          end
        end
        puts "#{count} fact_intervention saved."
      end

      desc "Import fact_contact data from MYSQL"
      task fact_contacts: :environment do
        FactContact.destroy_all
        count = 0
        Lead.find_each do |record|
          fc = FactContact.new
          fc.contactId = record.id
          fc.createdOn = Time.at(record.created_at).to_datetime
          fc.companyName = record.cie_name
          fc.email = record.email
          fc.projectName = record.project_name
          if fc.save
            count = count + 1
          else
            puts "... bad: #{u.errors.full_messages.join(',')}"
          end
        end
        puts "#{count} fact_contacts saved."
      end

      desc "Import fact_elevator data from MYSQL"
      task fact_elevators: :environment do
        FactElevator.destroy_all
        count = 0
        Elevator.find_each do |elevator|
          fe = FactElevator.new
          fe.serialNumber = elevator.Serial_number
          fe.dateOfCommissioning = elevator.Date_of_commissioning
          building = elevator.column.battery.building
          adress = Adress.find(building.adress_id)
          fe.buildingId = building.id
          fe.customerId = building.customer_id
          fe.buildingCity = adress.city
          
          if fe.save
            count = count + 1
          else
            puts "... bad: #{u.errors.full_messages.join(',')}"
          end  
         end
        puts "#{count} fact_elevators saved."
      end


      desc "Import dim_customers data from MYSQL"
      task dim_customers: :environment do
        DimCustomer.destroy_all
        count = 0
        Customer.find_each do |record|
          dc = DimCustomer.new
          dc.id = record.id
          dc.createdOn = Time.at(record.created_at).to_datetime
          dc.companyName = record.Company_Name
          dc.fullNameOfMainContact = record.Full_Name_of_the_company_contact
          dc.emailOfMainContact = record.Email_of_the_company_contact
          dc.nbElevator = 0 
          buildings = Building.where(customer_id: record.id)
          buildings.each do |building|
            batteries = Battery.where(building_id: building.id)
            batteries.each do |battery|
              columns = Column.where(battery_id: battery.id)
              columns.each do |column|
                dc.nbElevator = Elevator.where(column_id: column.id).count
                puts dc.nbElevator
              end
            end
          end
        dc.customerCity = record.adress.city
        if dc.save
          count = count + 1
        else
          puts "... bad: #{u.errors.full_messages.join(',')}"
        end
      end
      puts "#{count} dim_customers saved."
    end
  end


    namespace :test do
      task :prepare do
        Rake::Task['db:test:prepare'].invoke
      end
    end

    # append and prepend proper tasks to all the tasks defined here above
    ns.tasks.each do |task|
      task.enhance ['postgres:set_custom_config'] do
        Rake::Task['postgres:revert_to_original_config'].invoke
      end
    end
  end

  task :set_custom_config do
    # save current vars
    @original_config = {
      env_schema: ENV['SCHEMA'],
      config: Rails.application.config.dup
    }

    # set config variables for custom database
    ENV['SCHEMA'] = 'postgres_db/schema.rb'
    Rails.application.config.paths['db'] = ['postgres_db']
    Rails.application.config.paths['db/migrate'] = ['postgres_db/migrate']
    # If you are using Rails 5 or higher change `paths['db/seeds']` to `paths['db/seeds.rb']`
    Rails.application.config.paths['db/seeds.rb'] = ['postgres_db/seeds.rb']
    Rails.application.config.paths['config/database'] = ['config/postgres_database.yml']
  end

  task :revert_to_original_config do
    # reset config variables to original values
    ENV['SCHEMA'] = @original_config[:env_schema]
    Rails.application.config = @original_config[:config]
  end
end
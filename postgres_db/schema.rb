# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_29_182733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.datetime "createdOn"
    t.string "companyName"
    t.string "fullNameOfMainContact"
    t.string "emailOfMainContact"
    t.integer "nbElevator"
    t.string "customerCity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.integer "contactId"
    t.datetime "createdOn"
    t.string "companyName"
    t.string "email"
    t.string "projectName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.integer "serialNumber"
    t.datetime "dateOfCommissioning"
    t.integer "buildingId"
    t.integer "customerId"
    t.string "buildingCity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_interventions", force: :cascade do |t|
    t.integer "employeeID"
    t.integer "buildingID"
    t.integer "batteryID"
    t.integer "columnID"
    t.integer "elevatorID"
    t.datetime "start_Date_And_Time_Of_the_Intervention"
    t.datetime "end_Date_And_Time_Of_The_Intervention"
    t.string "result"
    t.string "report"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quoteId"
    t.datetime "createdOn"
    t.string "companyName"
    t.string "email"
    t.integer "nbElevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

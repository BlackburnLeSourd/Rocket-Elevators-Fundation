class DataController < AdminController
    before_action :authenticate_user!
    @disable_nav = true

    def index
    end

    def chart
    end

    def map
       maps = []
        Map.find_each do |m|
            maps.push({
                'address' => m.location_of_the_building,
                'floors' => m.no_of_floors_in_the_building,
                'client_name' => m.client_name,
                'batteries' => m.no_of_batteries,
                'elevators' => m.no_of_elevators,
                'columns' => m.no_of_columns,
                'technical_contact' => m.full_name_of_technical_contact,
                'lat' => m.latitude.to_f,
                'lng' => m.longitude.to_f
            })
        end
        @mapData = maps.to_json
    end

    def playbriefing
        elevators = Elevator.count
        buildings = Building.count
        elevators_offline = Elevator.where(status: 'offline').count
        quotes = Quote.where(processed: false).count
        leads = Lead.count
        batteries = Battery.count
        cities = Adress.distinct.count(:city)

        contents = "Hello! Welcome to the Rocket Elevators Admin panel. There are currently " + elevators.to_s + "elevators deployed in the " + buildings.to_s + "buildings of your customers. Currently, " + elevators_offline.to_s + " elevators are not in Running Status and are being serviced. You currently have " + quotes.to_s + "q uotes awaiting processing.
        You currently have " + leads.to_s + " leads in your contact requests. And " + 
        batteries.to_s + "batteries are deployed across " + cities.to_s + "cities."
        
        # Create an Amazon Polly client using
        # credentials from the shared credentials file ~/.aws/credentials
        # and the configuration (region) from the shared configuration file ~/.aws/config
        polly = Aws::Polly::Client.new(
            region: ENV['AWS_REGION'],
            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        )

        resp = polly.synthesize_speech({
            output_format: "mp3",
            text: contents,
            voice_id: "Joanna",
        })

        # Save output
        mp3_file = "app/assets/audios/" + Time.now().to_s + ".mp3"

        IO.copy_stream(resp.audio_stream, mp3_file)

        puts 'Wrote MP3 content to: ' + mp3_file
        rescue StandardError => ex
        puts 'Got error:'
        puts 'Error message:'
        puts ex.message

        def audio_path(source, options = {})
            path_to_asset(source, {type: :audio}.merge!(options))
        end
    end

end
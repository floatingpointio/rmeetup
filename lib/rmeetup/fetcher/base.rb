module RMeetup
  module Fetcher
    class ApiError < StandardError
      def initialize(error_message, request_url)
        super "Meetup API Error: #{error_message} - API URL: #{request_url}"
      end
    end

    class NoResponseError < StandardError
      def initialize
        super "No Response was returned from the Meetup API."
      end
    end

    # == RMeetup::Fetcher::Base
    #
    # Base fetcher class that other fetchers
    # will inherit from.
    class Base
      def initialize
        @type = nil
      end

      # Fetch and parse a response
      # based on a set of options.
      # Override this method to ensure
      # neccessary options are passed
      # for the request.
      def fetch(options = {})
        path = path_and_query(options)
        json = get_response(path)
        data = JSON.parse(json)

        # Check to see if the api returned an error
        raise ApiError.new(data['details'],path) if data.has_key?('problem')

        collection = RMeetup::Collection.build(data)

        # Format each result in the collection and return it
        collection.map!{|result| format_result(result)}
      end

      protected
        # OVERRIDE this method to format a result section
        # as per Result type.
        # Takes a result in a collection and
        # formats it to be put back into the collection.
        def format_result(result)
          result
        end

        def path_and_query(options)
          base_path + params_for(options)
        end

        def base_path
          "/2/#{@type}/" unless @type.nil?
        end

        # Create a query string from an options hash
        def params_for(options)
          '?' + URI.encode_www_form(options)
        end

        def get_response(path)
          http = Net::HTTP.new "api.meetup.com", 443
          http.use_ssl = true

          http.get(path).body || raise(NoResponseError.new)
        end
    end
  end
end

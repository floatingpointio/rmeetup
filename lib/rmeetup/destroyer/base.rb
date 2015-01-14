module RMeetup
  module Destroyer
    DOMAIN = "api.meetup.com"

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

    # == RMeetup::Destroyer::Base
    #
    # Base destroyer class that other destroyers will inherit from.
    class Base
      def initialize
        @type = nil
        @id = nil
      end

      # Delete and return a response based on a set of options.
      # Override this method to ensure necessary options are passed for the request.
      #
      # @param options [Hash] Options for deleting, it's usually empty except the api key
      # @return True on success
      def delete(options = {})
        raise NotConfiguredError, /deletes only possible with a concrete destroyer/ if @type.nil?

        res = delete_response(base_url, options)
        data = JSON.parse(res.body)

        unless res.is_a?(Net::HTTPSuccess)

          # Check to see if the api returned an error
          if data.has_key?('problem')
            raise ApiError.new(data['details'], build_path(options))
          else
            raise NoResponseError.new
          end
        end

        true
      end

      def build_path(options)
        base_url + query(options)
      end

      # Create a query string from an options hash
      def query(options)
        '?' + URI.encode_www_form(options)
      end

      protected
      # OVERRIDE this method to format a result section
      # as per Result type.
      # Takes a result in a collection and
      # formats it to be put back into the collection.
      def format_result(result)
        result
      end

      def base_url
        "https://api.meetup.com/2/#{@type}/#{@id}"
      end

      def delete_response(url, options)
        path = url + query(options)
        req = Net::HTTP.new DOMAIN, 443
        req.use_ssl = true
        req.delete(path)
      end
    end
  end
end

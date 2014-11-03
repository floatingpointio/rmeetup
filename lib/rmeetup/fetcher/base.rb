module RMeetup
  module Fetcher
    Domain = "api.meetup.com"

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
    # Base fetcher class that other fetchers will inherit from.
    class Base
      def initialize
        @type = nil
      end

      # Fetch and parse a response based on a set of options.  Override this method to ensure neccessary options are passed for the request.
      #
      # @param [Hash] Options for deciding what and how to fetch
      # @return [RMeetup::Collection] Collection of appropriate entities
      def fetch(options = {})
        raise NotConfiguredError, /fetches only possible with a concrete fetcher/ if @type.nil?
        path = path_and_query(options)

        # Fetch and parse data from Meetup
        response_body = requester(options).get(path).body || raise(NoResponseError.new)
        data = JSON.parse(response_body)

        # Check to see if the api returned an error
        raise ApiError.new(data['details'],path) if data.has_key?('problem')

        collection = RMeetup::Collection.build(data)

        # Format each result in the collection and return it
        collection.map!{|result| format_result(result)}
      end
      
      def path_and_query(options)
        base_path + query(options)
      end

      def base_path
        "/2/#{@type}"
      end

      # Create a query string from an options hash
      def query(options)
        '?' + URI.encode_www_form(options)
      end
      
      # Decides whether to use HTTP or HTTPS. HTTPS is needed if we're authoizing via the :access_token
      #
      # @param [Hash] Constructed HTTP(S) query
      # @return [Symbol] :http or :https
      def requester(q)
        if q.has_key?(:api_key)
          http
        elsif q.has_key?(:access_token)
          https
        else
          http
        end
      end

      protected
      # OVERRIDE this method to format a result section
      # as per Result type.
      # Takes a result in a collection and
      # formats it to be put back into the collection.
      def format_result(result)
        result
      end

      def http
        Net::HTTP.new Domain, 80
      end

      def https
        c = Net::HTTP.new Domain, 443
        c.use_ssl = true
        c
      end

    end
  end
end

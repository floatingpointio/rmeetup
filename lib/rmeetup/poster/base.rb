require 'net/http'
require 'net/https'

module RMeetup
  module Poster
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

    module ResponseType
      BASIC_RESPONSE = 1
      OBJECT = 2
    end

    # == RMeetup::Poster::Base
    # 
    # Base poster class that other posters
    # will inherit from.
    class Base
      def initialize
        @type = nil
        @response_type = ResponseType::BASIC_RESPONSE
      end
      
      # Fetch and parse a response
      # based on a set of options.
      # Override this method to ensure
      # neccessary options are passed
      # for the request.
      def post(options = {})
        raise NotConfiguredError, /posts only possible with a concrete type/ if @type.nil?

        url = build_url(options)
        res = post_response(url, options)
        response_body = res.body
        data = JSON.parse(response_body)

        unless res.is_a?(Net::HTTPSuccess)
          # Check to see if the api returned an error
          if data.has_key?('problem')
            raise ApiError.new(data['details'], url)
          else
            raise NoResponseError.new
          end
        end

        case @response_type
          when ResponseType::OBJECT
            format_result(data)
          else
            res
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
      
        def build_url(options)
          base_url
        end
      
        def base_url
          "https://api.meetup.com/2/#{@type}/"
        end
        
        # Create a query string from an options hash
        def params_for(options)
          params = []
          options.each do |key, value|
            params << "#{key}=#{value}"
          end
          "?#{params.join("&")}"
        end
        
        # Encode a hash of options to be used as request parameters
        def encode_options(options)
          options.each do |key,value|
            options[key] = URI.encode(value.to_s)
          end
        end
        
        def post_response(url, options)
          sslurl = URI.parse(url)

          https = Net::HTTP.new(sslurl.host, sslurl.port)
          https.use_ssl = true
          req = Net::HTTP::Post.new(sslurl.path)
          req.set_form_data(options)
          res = https.request(req)
        end
    end
  end
end

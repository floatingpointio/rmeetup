require 'rmeetup/errors'
require 'rmeetup/fetcher'
require 'rmeetup/poster'
require 'rmeetup/destroyer'

module RMeetup

  # == RMeetup::Configuration
  #
  # Holds various configuration data. For now it's
  # only used to hold the API key. You can get one
  # at http://www.meetup.com/meetup_api/key/
  #
  # Needs to be the group organizers API Key
  # to be able to RSVP for other people
  class Configuration
    attr_accessor :api_key, :access_token
  end

  # == RMeetup::Client
  # 
  # Essentially a simple wrapper to delegate requests to
  # different fetcher classes who are responsible for fetching
  # and parsing their own responses.
  class Client
    # Initializes a new Client object
    #
    # @param opts [Hash] Options, currenlty only for providing clinet with the auth data
    # @yield [Configuration], object with accessors :api_key and :access_token, used for providing auth data in a backward compatible way
    # @return [RMeetup::Client]
    def initialize(opts = {})
      if not(opts.empty?)
        configuration.api_key = opts[:api_key] if opts.has_key?(:api_key)
        configuration.access_token = opts[:access_token] if opts.has_key?(:access_token)
      else
        yield(configuration) if block_given?
      end
      check_configuration!
    end

    # Delegates to appropriate RMeetup::Fetcher
    def fetch(type, options = {})
      RMeetup::Fetcher.for(type).fetch options.merge(auth)
    end

    # Delegates to appropriate RMeetup::Poster
    def post(type, options = {})
      RMeetup::Poster.for(type).post options.merge(auth)
    end

    # Delegates to appropriate RMeetup::Destroyer
    def delete(type, id, options = {})
      RMeetup::Destroyer.for(type, id).delete options.merge(auth)
    end

    private
    # Creates or returns Client configuration
    #
    # @return [RMeetup::Configuration] Configuration is created and returned during Client initializtion and just returned otherwise
    def configuration
      @configuration ||= Configuration.new
    end

    # Construct authorization part of the query. Preferes :api_key over :access_token
    #
    # @return [Hash] Authorization part of the query.
    def auth
      if configuration.api_key
        { :key => configuration.api_key, :sign => 'true' }
      elsif configuration.access_token
        { :access_token => configuration.access_token }
      end
    end

    # Ensures that API key is set during configuration.
    #
    # @raise [RMeetup::Error::ConfigurationError] Error is raised when API key isn't provided
    def check_configuration!
      fail Error::NotConfiguredError.new unless configuration.api_key || configuration.access_token
    end

  end
end

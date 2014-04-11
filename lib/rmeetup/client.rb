require 'rmeetup/errors'
require 'rmeetup/fetcher'
require 'rmeetup/poster'

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
    attr_accessor :api_key
  end

  # == RMeetup::Client
  # 
  # Essentially a simple wrapper to delegate requests to
  # different fetcher classes who are responsible for fetching
  # and parsing their own responses.
  class Client
    # Initializes a new Client object
    #
    # @param type [Symbol] A type of fetcher we're going to use. You use it to define what data do you want from meetup.com
    # @return [RMeetup::Client]
    def initialize
      yield(configuration) if block_given?
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

    private
    # Creates or returns Client configuration
    #
    # @return [RMeetup::Configuration] Configuration is created and returned during Client initializtion and just returned otherwise
    def configuration
      @configuration ||= Configuration.new
    end

    def auth
      { :key => configuration.api_key }
    end

    # Ensures that API key is set during configuration.
    #
    # @raise [RMeetup::Error::ConfigurationError] Error is raised when API key isn't provided
    def check_configuration!
      fail Error::NotConfiguredError.new unless configuration.api_key
    end

  end
end

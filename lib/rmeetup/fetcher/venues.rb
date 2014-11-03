module RMeetup
  module Fetcher
    class Venues < Base
      def initialize
        @type = :venues
      end
      
      # Turn the result hash into a Venue Class
      def format_result(result)
        RMeetup::Type::Venue.new(result)
      end
    end
  end
end
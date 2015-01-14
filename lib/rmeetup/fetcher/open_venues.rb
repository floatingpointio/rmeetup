module RMeetup
  module Fetcher
    class OpenVenues < Base
      def initialize
        @type = :open_venues
      end

      # Turn the result hash into a Venue Class
      def format_result(result)
        RMeetup::Type::Venue.new(result)
      end
    end
  end
end
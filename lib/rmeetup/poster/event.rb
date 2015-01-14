module RMeetup
  module Poster
    class Event < Base
      def initialize
        @type = :event
        @response_type = ResponseType::OBJECT
      end

      # Turn the result hash into an Event Class
      def format_result(result)
        RMeetup::Type::Event.new(result)
      end

    end
  end
end

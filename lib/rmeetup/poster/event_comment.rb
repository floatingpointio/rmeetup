module RMeetup
  module Poster
    class EventComment < Base
      def initialize
        @type = :event_comment
        @response_type = ResponseType::BASIC_RESPONSE
      end
      
      # Turn the result hash into a Comment Class
      def format_result(result)
        RMeetup::Type::EventComment.new(result)
      end
    end
  end
end

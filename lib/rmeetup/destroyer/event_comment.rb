module RMeetup
  module Destroyer
    class EventComment < Base
      def initialize(id)
        @type = :event_comment
        @id = id
      end
    end
  end
end

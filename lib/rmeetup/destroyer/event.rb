module RMeetup
  module Destroyer
    class Event < Base
      def initialize(id)
        @type = :event
        @id = id
      end
    end
  end
end

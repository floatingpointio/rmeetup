module RMeetup
  module Destroyer
    class Photo < Base
      def initialize(id)
        @type = :photo
        @id = id
      end
    end
  end
end

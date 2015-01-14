module RMeetup
  module Destroyer
    class MemberPhoto < Base
      def initialize(id)
        @type = :member_photo
        @id = id
      end
    end
  end
end

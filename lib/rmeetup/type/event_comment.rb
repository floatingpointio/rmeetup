module RMeetup
  module Type
    
    # == RMeetup::Type::Comment
    #
    # Data wraper for a Comment fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this comment.
    
    # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
    # See http://www.meetup.com/meetup_api/docs/ew/comment/ for available fields
    
    class EventComment
      
      attr_accessor :comment
      
      def initialize(comment = {})
        self.comment = comment
      end
      
      def method_missing(id, *args)
        return self.comment[id.id2name]
      end
      
      # Special accessors that need typecasting or other parsing
      
      def rating
        return self.comment['rating'].to_i
      end
      def created
        return DateTime.parse(self.comment['created'])
      end
      def lat
        return self.comment['lat'].to_f
      end
      def lon
        return self.comment['lon'].to_f
      end
    end
  end
end

module RMeetup
  module Type
    
    # == RMeetup::Type::Rsvp
    #
    # Data wraper for a Rsvp fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this rsvp.
    
    # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
    # See http://www.meetup.com/meetup_api/docs/ew/rsvps/ for available fields
    
    class Rsvp
      def initialize(rsvp = {})
        @rsvp = rsvp
      end
      attr_accessor :rsvp
      alias_method :to_h, :rsvp
      
      def method_missing(id, *args)
        if rsvp.has_key?(id.id2name)
          rsvp[id.id2name]
        else
          fail NoMethodError.new('no method')
        end
      end
      
      # Special accessors that need typecasting or other parsing
      
      def lat
        return self.rsvp['lat'].to_f
      end
      def lon
        return self.rsvp['lon'].to_f
      end
    end
  end
end

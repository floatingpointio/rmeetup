module RMeetup
  module Type

    # == RMeetup::Type::Event
    #
    # Data wraper for a Event fethcing response
    # Used to access result attributes as well
    # as progammatically fetch relative data types
    # based on this event.

    class Event
      def initialize(event = {})
        @event = event
      end
      attr_reader :event
      alias_method :to_h, :event

      def method_missing(id, *args)
        if event.has_key?(id.id2name)
          event[id.id2name]
        else
          fail NoMethodError.new('no method')
        end
      end

      # Special accessors that need typecasting or other parsing
      def id
        event['id'].to_i
      end
      def lat
        event['lat'].to_f
      end
      def lon
        event['lon'].to_f
      end
      def rsvpcount
        event['rsvpcount'].to_i
      end
      def updated
        DateTime.parse(self.event['updated'])
      end
      def time
        Time.at(self.event['time']/1000).to_datetime
      end
      def venue
        OpenStruct.new( self.event['venue'] )
      end
    end
  end
end

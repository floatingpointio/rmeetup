module RMeetup
  module Error
    class NotConfiguredError < StandardError
      def initialize
        super "Please provide your Meetup API key before fetching data."
      end
    end

    class InvalidRequestTypeError < StandardError
      def initialize(type)
        super "Fetch type '#{type}' not a valid."
      end
    end
  end
end

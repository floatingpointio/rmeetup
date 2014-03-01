require "rmeetup/poster/base"
require "rmeetup/poster/event_comment"

module RMeetup
  module Poster
    
    class << self
      # Return a fetcher for given type
      def for(type)
        return  case type.to_sym
                when :event_comment
                  EventComment.new
                end
      end 
    end
  end
end

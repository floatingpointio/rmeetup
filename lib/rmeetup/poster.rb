require "rmeetup/poster/base"
require "rmeetup/poster/event"
require "rmeetup/poster/event_comment"

module RMeetup
  module Poster

    def self.for(type)
      name = type.to_s.camel_case.to_sym
      if (name && constants.include?(name))
        const_get(name).new
      else
        raise RMeetup::Error::InvalidRequestTypeError.new(type)
      end
    end 

  end
end

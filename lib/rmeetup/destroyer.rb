require 'rmeetup/destroyer/base'
require 'rmeetup/destroyer/event'
require 'rmeetup/destroyer/event_comment'
require 'rmeetup/destroyer/member_photo'
require 'rmeetup/destroyer/photo'

module RMeetup
  module Destroyer

    def self.for(type, id)
      name = type.to_s.camel_case.to_sym
      if (name && constants.include?(name))
        const_get(name).new(id)
      else
        raise RMeetup::Error::InvalidRequestTypeError.new(type)
      end
    end

  end
end

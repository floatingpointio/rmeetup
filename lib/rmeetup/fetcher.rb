require 'core_ext/string'
require 'rmeetup/fetcher/base'
require 'rmeetup/fetcher/topics'
require 'rmeetup/fetcher/cities'
require 'rmeetup/fetcher/members'
require 'rmeetup/fetcher/rsvps'
require 'rmeetup/fetcher/events'
require 'rmeetup/fetcher/open_events'
require 'rmeetup/fetcher/groups'
require 'rmeetup/fetcher/comments'
require 'rmeetup/fetcher/photos'
require 'rmeetup/fetcher/venues'

module RMeetup
  module Fetcher

    def self.for(type)
      if (type && fetcher = const_get(type.to_s.camel_case.to_sym))
        fetcher.new
      end 
    end

  end
end

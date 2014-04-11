require 'http/request'
require 'json'
require_relative 'connection'
require_relative 'response'

module RMeetup
  module Streaming

    class Client
      attr_writer :connection

      def initialize(options = {})
        @connection = Streaming::Connection.new(options)
      end

      def rsvps(options = {}, &block)
        request(:get, 'http://stream.meetup.com/2/rsvps', options, &block)
      end

      def open_events(options = {}, &block)
        request(:get, 'http://stream.meetup.com/2/open_events', options, &block)
      end

      def event_comments(options = {}, &block)
        request(:get, 'http://stream.meetup.com/2/event_comments', options, &block)
      end

    private

      def request(method, uri, params)
        request  = HTTP::Request.new(method, uri)
        response = Streaming::Response.new do |data|
          yield(data)
        end
        @connection.stream(request, response)
      end

    end
  end
end


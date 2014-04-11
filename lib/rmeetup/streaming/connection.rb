require 'http/parser'
require 'resolv'

module RMeetup
  module Streaming

    class Connection

      def initialize(options = {})
        @tcp_socket_class = options[:tcp_socket_class] || TCPSocket
      end

      def stream(request, response)
        client = @tcp_socket_class.new(Resolv.getaddress(request.uri.host), request.uri.port)

        request.stream(client)

        client.each do |line|
          response << line
        end
      rescue EOFError
        puts "Stream ended"
      end
    end

  end
end


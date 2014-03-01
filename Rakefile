require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('rMeetup','1.1') do |p|
  p.description = "A Ruby wrapper for the Meetup REST API v2"
  p.url         = "https://github.com/zishan/rmeetup"
  p.author      = "Zishan Ahmad"
  p.email       = "me@zishanahmad.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies  = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "rmeetup"
  s.version     = "1.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jared Pace", "Jason Berlinsky", "Tommy Chan", "Tanner Mares", "Zishan Ahmad", "Nikica Jokić"]
  s.email       = ["jdpace@github.com", "jason@jasonberlinsky.com", "tommytcchan@gmail.com", "tannermares@gmail.com", "me@zishanahmad.com", "neektza@gmail.com"]
  s.homepage    = "https://rubygems.org/gems/rMeetup"
  s.summary     = "A Ruby wrapper for the Meetup REST API v2"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("lib/**/*")
  s.require_path = 'lib'
end

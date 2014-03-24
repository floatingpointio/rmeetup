# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'rmeetup/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY

  spec.name        = "rmeetup"
  spec.authors     = ["Jared Pace", "Jason Berlinsky", "Tommy Chan", "Tanner Mares", "Zishan Ahmad", "Nikica Jokić"]
  spec.email       = ["jdpace@github.com", "jason@jasonberlinsky.com", "tommytcchan@gmail.com", "tannermares@gmail.com", "me@zishanahmad.com", "neektza@gmail.com"]
  spec.homepage    = "https://rubygems.org/gems/rMeetup"
  spec.summary     = "A Ruby wrapper for the Meetup REST API v2"

  spec.required_rubygems_version = ">= 1.3.6"

  spec.add_dependency 'json'
  specpec.add_development_dependency 'bundler'

  spec.files = %w[LICENSE.md README.md Rakefile rmeetup.gemspec]
  spec.files += Dir.glob('lib/**/*.rb')
  spec.files += Dir.glob('spec/**/*')

  spec.test_files = Dir.glob('spec/**/*')
  spec.require_paths = %w[lib]
  
  spec.version = RMeetup::Version
end

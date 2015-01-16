# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'rmeetup/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY

  spec.name        = 'rMeetup'
  spec.description = 'meetup.com API wrapper for Ruby'
  spec.authors     = ['Jared Pace', 'Jason Berlinsky', 'Tommy Chan', 'Tanner Mares', 'Zishan Ahmad', 'Nikica Jokić']
  spec.email       = ['jdpace@github.com', 'jason@jasonberlinsky.com', 'tommytcchan@gmail.com', 'tannermares@gmail.com', 'me@zishanahmad.com', 'neektza@gmail.com']
  spec.homepage    = 'https://github.com/floatingpointio/rmeetup'
  spec.summary     = 'A Ruby wrapper for the Meetup API v2'

  spec.required_rubygems_version = '>= 1.3.6'

  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'buftok', '~> 0.2'
  spec.add_dependency 'http', '~> 0.6'
  spec.add_dependency 'http_parser.rb', '~> 0.6'
  
  spec.add_development_dependency 'bundler', '~> 1.6'

  spec.files = %w[LICENSE.md README.md Rakefile rmeetup.gemspec]
  spec.licenses = %w[MIT]
  spec.files += Dir.glob('lib/**/*.rb')
  spec.files += Dir.glob('spec/**/*')

  spec.test_files = Dir.glob('spec/**/*')
  spec.require_paths = %w[lib]
  
  spec.version = RMeetup::Version
end

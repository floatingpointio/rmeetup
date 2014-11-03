$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'coveralls'
Coveralls.wear!

require 'rmeetup'
TEST_ROOT = File.dirname(__FILE__)

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end 

# Meetup API Key
#
# Please provide your meetup api key to access
# the API. Some of the spec require access to the API.
# You can get your API key by loging in to meetup.com
# and looking in your account info.
API_KEY = '663a24605a37767831495d6332546b4a' #nil

# Don't let the specs run without an API key
raise StandardError, 'Please enter your Meetup API key in the spec_helper.rb file to be used for testing purposes.' unless API_KEY

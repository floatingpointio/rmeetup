require 'spec_helper'

describe RMeetup::Client do

  context 'trying to initialize a Client without providing an API key' do
    it 'should throw an error trying to search' do
      expect { RMeetup::Client.new }.to raise_error(RMeetup::Error::NotConfiguredError)
    end
  end

  describe "#fetch" do
    before do
      @topics_fetcher = double(RMeetup::Fetcher::Topics)
      @topics_fetcher.stub(:fetch).and_return([])
    end

    let (:client) do
      RMeetup::Client.new {|c| c.api_key = API_KEY}
    end

    it 'should delegate to appropriate Fetcher' do
      expect(RMeetup::Fetcher).to receive(:for)
      client.fetch(:venues)
    end

    # it 'should throw an error if invalid data type is requested' do
    #   expect { client.fetch(:clowns) }.to raise_error(RMeetup::InvalidRequestTypeError)
    # end
  end

end

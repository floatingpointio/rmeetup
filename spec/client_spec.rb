require 'spec_helper'

describe RMeetup::Client do

  context 'provided no API key' do
    it 'fails with an NotConfiguredError' do
      expect { RMeetup::Client.new }.to raise_error(RMeetup::Error::NotConfiguredError)
    end
  end

  context 'provided with proper options' do

    describe "#fetch" do
      let(:client) { RMeetup::Client.new({api_key: API_KEY}) }

      it 'should throw an error if invalid data type is requested' do
        expect do
          client.fetch(:clowns)
        end.to raise_error(RMeetup::Error::InvalidRequestTypeError)
      end

      context 'when fetching :groups' do
        it 'returns a collection of Groups' do
          VCR.use_cassette('fetching_groups') do
            client.fetch(:groups, { topic: 'Ruby' }).each do |result|
              result.should be_kind_of(RMeetup::Type::Group)
            end
          end
        end
      end

      context 'when fetching :events' do
        it 'returns a collection of Events' do
          VCR.use_cassette('fetching_events') do
            client.fetch(:events, { group_id: '95875' }).each do |result|
              result.should be_kind_of(RMeetup::Type::Event)
            end
          end
        end
      end

      context 'when fetching :open_events' do
        it 'returns a collection of Events' do
          VCR.use_cassette('fetching_open_events') do
            client.fetch(:open_events, {country: 'US', :zip=>"95120", :state=>"CA"}).each do |result|
              result.should be_kind_of(RMeetup::Type::Event)
            end
          end
        end
      end

      context 'when fetching :rsvps' do
        it 'returns a collection of RSVPs' do
          VCR.use_cassette('fetching_rsvps') do
            client.fetch(:rsvps, { event_id: '1342342' }).each do |result|
              result.should be_kind_of(RMeetup::Type::Rsvp)
            end
          end
        end
      end

      context 'when fetching :members' do
        it 'returns a collection of Members' do
          VCR.use_cassette('fetching_members') do
            client.fetch(:members, { group_id: '95875' }).each do |result|
              result.should be_kind_of(RMeetup::Type::Member)
            end
          end
        end
      end

      context 'when fetching :photos' do
        it 'returns a collection of Photos' do
          VCR.use_cassette('fetching_photos') do
            client.fetch(:photos, { event_id: '13452536' }).each do |result|
              result.should be_kind_of(RMeetup::Type::Photo)
            end
          end
        end
      end

      context 'when fetching :cities' do
        it 'returns a collection of Cities' do
          VCR.use_cassette('fetching_cities') do
            client.fetch(:cities).each do |result|
              result.should be_kind_of(RMeetup::Type::City)
            end
          end
        end
      end
    end
  end
end

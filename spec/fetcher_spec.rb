require 'spec_helper'

describe RMeetup::Fetcher, 'being told to get a certain type of fetcher' do
  before do
    @fetcher_types = %w(cities members rsvps events groups photos open_events)
  end
  
  it 'should return the correct fetcher' do
    @fetcher_types.each do |type|
      fetcher = RMeetup::Fetcher.for(type)
      expect(fetcher.class.name).to eq("RMeetup::Fetcher::#{type.camel_case}")
    end
  end
  
  it 'should return nil if asked for an invalid fetcher' do
    expect { RMeetup::Fetcher.for(:clowns) }.to raise_error
  end
end

require 'spec_helper'

describe RMeetup::Poster, 'being told to get a certain type of poster' do
  before do
    @poster_types = %w(event event_comment)
  end

  it 'should return the correct poster' do
    @poster_types.each do |type|
      poster = RMeetup::Poster.for(type)
      expect(poster.class.name).to eq("RMeetup::Poster::#{type.camel_case}")
    end
  end

  it 'should raise an error if asked for an invalid poster' do
    expect { RMeetup::Poster.for(:eminbugra) }.to raise_error
  end
end

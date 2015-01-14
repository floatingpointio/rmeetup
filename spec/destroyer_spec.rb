require 'spec_helper'

describe RMeetup::Poster, 'being told to get a certain type of poster' do
  before do
    @destroyer_types = %w(event event_comment member_photo photo)
  end

  it 'should return the correct destroyer' do
    @destroyer_types.each do |type|
      destroyer = RMeetup::Destroyer.for(type, 123)
      expect(destroyer.class.name).to eq("RMeetup::Destroyer::#{type.camel_case}")
    end
  end

  it 'should raise an error if asked for an invalid destroyer' do
    expect { RMeetup::Destroyer.for(:eminbugra, 123) }.to raise_error
  end
end

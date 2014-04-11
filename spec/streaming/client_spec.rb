require 'spec_helper'


describe RMeetup::Streaming::Client do

  before do
    @client = RMeetup::Streaming::Client.new
  end

  describe "#rsvps" do
    it "should stream rsvps"
  end
  
  describe "#open_events" do
    it "should stream open events"
  end
  
  describe "#event_comments" do
    it "should stream event comments"
  end
  
end

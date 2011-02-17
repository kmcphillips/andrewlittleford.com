require 'spec_helper'

describe Event do
  before(:each) do
    @now = Time.now
    @valid_attributes = {:title => "Pie Festival", :description => "So much pie.", :starts_at => @now - 2.days}
    @event = Event.new @valid_attributes
  end

  describe "with real events" do
    before(:each) do
      t = Time.now
      Time.stub!(:now => t)

      @upcoming = Event.create! @valid_attributes.merge(:starts_at => t + 3.days)
      @current = Event.create! @valid_attributes.merge(:starts_at => t - 1.hour)
      @past = Event.create! @valid_attributes.merge(:starts_at => t - 1.day)
    end

    describe "scopes" do
      it "should find the upcoming events" do
        Event.upcoming.should == [@upcoming]
      end

      it "should find the current event" do
        Event.current.should == [@current]
      end

      it "should find the past events" do
        Event.past == [@past]
      end
    end

    describe "status" do
      it "should know it is upcoming" do
        @upcoming.status.should == "Upcoming"
      end

      it "should know it is current" do
        @current.status.should == "Current"
      end

      it "should know it is past" do
        @past.status.should == "Past"
      end
    end

    describe "current?" do
      it "should know the current event" do
        @current.current?.should be_true
      end

      it "should know the others are not current" do
        @past.current?.should be_false
        @upcoming.current?.should be_false
      end
    end

    describe "upcoming?" do
      it "should know the upcoming event" do
        @upcoming.upcoming?.should be_true
      end

      it "should know the others are not upcoming" do
        @past.upcoming?.should be_false
        @current.upcoming?.should be_false
      end
    end

    describe "past?" do
      it "should know the past event" do
        @past.past?.should be_true
      end

      it "should know the others are not past" do
        @upcoming.past?.should be_false
        @current.past?.should be_false
      end
    end

    after(:each) do
      Event.destroy_all
    end
  end

end


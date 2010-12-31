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
      @current = Event.create! @valid_attributes.merge(:starts_at => t - 1.hour, :ends_at => t + 1.hour)
      @past1 = Event.create! @valid_attributes.merge(:starts_at => t - 1.day)
      @past2 = Event.create! @valid_attributes.merge(:starts_at => t - 3.days, :ends_at => t - 2.days)
    end

    describe "scopes" do
      it "should find the upcoming events" do
        Event.upcoming.should == [@upcoming]
      end

      it "should find the current event" do
        Event.current.should == [@current]
      end

      it "should find the past events" do
        Event.past == [@past1, @past2]
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
        @past1.status.should == "Past"
      end

      it "should also know it is past" do
        @past2.status.should == "Past"
      end
    end

    describe "current?" do
      it "should know the current event" do
        @current.current?.should be_true
      end

      it "should know the others are not current" do
        @past1.current?.should be_false
        @past2.current?.should be_false
        @upcoming.current?.should be_false
      end
    end

    describe "upcoming?" do
      it "should know the upcoming event" do
        @upcoming.upcoming?.should be_true
      end

      it "should know the others are not upcoming" do
        @past1.upcoming?.should be_false
        @past2.upcoming?.should be_false
        @current.upcoming?.should be_false
      end
    end

    describe "past?" do
      it "should know the past events" do
        @past1.past?.should be_true
        @past2.past?.should be_true
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

  describe "duration" do
    it "should know the length of the event" do
      @event.ends_at = @now - 1.day
      @event.duration.should == 1.day
    end
    
    it "should handle a nil ends_at" do
      @event.duration.should be_nil
    end
  end
end


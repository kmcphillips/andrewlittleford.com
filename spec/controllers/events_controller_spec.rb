require 'spec_helper'

describe EventsController do

  def mock_event(stubs={})
    @mock_event ||= mock_model(Event, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all events as @events" do
      Event.stub(:upcoming => "upcoming", :current => "current", :past => mock(:past, :limit => "past"))
      get :index
      assigns(:upcoming).should eq("upcoming")
      assigns(:current).should eq("current")
      assigns(:past).should eq("past")
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      Event.stub(:find).with("37") { mock_event }
      get :show, :id => "37"
      assigns(:event).should be(mock_event)
    end
  end
end

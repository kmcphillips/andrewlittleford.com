require 'spec_helper'

describe EventsController do
  let(:event){ FactoryGirl.create(:event) }

  describe "GET index" do
    it "assigns all events as @events" do
      past = FactoryGirl.create(:event, starts_at: Time.now - 2.days)
      current = FactoryGirl.create(:event, starts_at: Time.now - 2.minutes)
      upcoming = FactoryGirl.create(:event, starts_at: Time.now + 2.days)
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:upcoming)).to eq([upcoming])
      expect(assigns(:current)).to eq([current])
      expect(assigns(:past)).to eq([past])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      get :show, id: event.id
      expect(response).to have_http_status(:ok)
      expect(assigns(:event)).to eq(event)
    end
  end
end

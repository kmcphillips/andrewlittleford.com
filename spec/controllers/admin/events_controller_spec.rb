require 'spec_helper'

describe Admin::EventsController do
  before(:each) do
    login_as_mock_user
  end

  let(:time){ Time.parse("2014-01-01 01:02:03") }

  describe "GET index" do
    let!(:event){ FactoryGirl.create(:event) }

    it "assigns all events as @events" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:event).new_record?).to be_truthy
    end
  end

  describe "GET edit" do
    let!(:event){ FactoryGirl.create(:event) }

    it "assigns the requested event as @event" do
      get :edit, id: event.id
      expect(response).to have_http_status(:ok)
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created event as @event" do
        post :create, event: {title: 'title', description: 'description', starts_at: time}
        expect(assigns(:event).title).to eq('title')
        expect(assigns(:event).description).to eq('description')
        expect(assigns(:event).starts_at).to eq(time)
        expect(response).to redirect_to(admin_events_url)
        expect(flash[:notice]).to be_present
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        post :create, event: {description: 'description'}
        expect(response).to have_http_status(:ok)
        expect(assigns(:event).persisted?).to be_falsy
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT update" do
    let!(:event){ FactoryGirl.create(:event) }

    describe "with valid params" do
      it "updates the requested event" do
        put :update, id: event.id, event: {description: 'new description'}
        expect(assigns(:event)).to eq(event)
        expect(response).to redirect_to(admin_events_url)
        expect(assigns(:event).reload.description).to eq('new description')
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        put :update, id: event.id, event: {title: ''}
        expect(assigns(:event)).to eq(event)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:event){ FactoryGirl.create(:event) }

    it "destroys the requested event" do
      delete :destroy, id: event.id
      expect(response).to redirect_to(admin_events_url)
    end
  end
end

require 'spec_helper'

describe Admin::TracksController do
  before(:each) do
    login_as_mock_user
  end

  describe "GET index" do
    let!(:track){ FactoryGirl.create(:track) }

    it "assigns all tracks as @tracks" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:tracks)).to eq([track])
    end
  end

  describe "GET new" do
    it "assigns a new track as @track" do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:track)).to_not be_persisted
    end
  end

  describe "GET edit" do
    let!(:track){ FactoryGirl.create(:track) }

    it "assigns the requested track as @track" do
      get :edit, id: track.id
      expect(response).to have_http_status(:ok)
      expect(assigns(:track)).to eq(track)
    end
  end

  describe "POST create" do
    let!(:track){ FactoryGirl.create(:track) }

    describe "with valid params" do
      it "assigns a newly created track as @track" do
        post :create, track: {title: 'title', mp3: fixture_file_upload('audio.mp3', 'audio/mp3') }
        expect(assigns(:track)).to be_persisted
        expect(response).to redirect_to(admin_tracks_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved track as @track" do
        post :create, track: {title: ''}
        expect(response).to have_http_status(:ok)
        expect(assigns(:track)).to_not be_persisted
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    let!(:track){ FactoryGirl.create(:track) }

    describe "with valid params" do
      it "updates the requested track" do
        put :update, id: track.id, track: {title: 'new title'}
        expect(assigns(:track)).to eq(track)
        expect(response).to redirect_to(admin_tracks_url)
      end
    end

    describe "with invalid params" do
      it "assigns the track as @track" do
        put :update, id: track.id, track: {title: ''}
        expect(response).to have_http_status(:ok)
        expect(assigns(:track)).to eq(track)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:track){ FactoryGirl.create(:track) }

    it "destroys the requested track" do
      delete :destroy, id: track.id
      expect(response).to redirect_to(admin_tracks_url)
    end
  end


  describe "POST sort" do
    it "to be tested" do
      skip
    end
  end
end

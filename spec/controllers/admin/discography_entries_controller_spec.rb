require 'spec_helper'

describe Admin::DiscographyEntriesController do
  before(:each) do
    login_as_mock_user
  end

  describe "GET index" do
    let!(:discography_entry){ FactoryGirl.create(:discography_entry) }

    it "assigns all entries as @entries" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:entries)).to eq([discography_entry])
    end
  end

  describe "GET new" do
    it "assigns a new entry as @entry" do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:entry).new_record?).to be_truthy
    end
  end

  describe "GET edit" do
    let!(:discography_entry){ FactoryGirl.create(:discography_entry) }

    it "assigns the requested entry as @entry" do
      get :edit, id: discography_entry.permalink
      expect(response).to have_http_status(:ok)
      expect(assigns(:entry)).to eq(discography_entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created entry as @entry" do
        post :create, discography_entry: {title: 'title', description: 'description'}
        expect(assigns(:entry).title).to eq('title')
        expect(assigns(:entry).description).to eq('description')
        expect(response).to redirect_to(admin_discography_entries_url)
        expect(flash[:notice]).to be_present
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved entry as @entry" do
        post :create, discography_entry: {description: 'description'}
        expect(response).to have_http_status(:ok)
        expect(assigns(:entry).persisted?).to be_falsy
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT update" do
    let!(:discography_entry){ FactoryGirl.create(:discography_entry) }

    describe "with valid params" do
      it "updates the requested entry" do
        put :update, id: discography_entry.permalink, discography_entry: {description: 'new description'}
        expect(assigns(:entry)).to eq(discography_entry)
        expect(response).to redirect_to(admin_discography_entries_url)
        expect(assigns(:entry).reload.description).to eq('new description')
      end
    end

    describe "with invalid params" do
      it "assigns the entry as @entry" do
        put :update, id: discography_entry.permalink, discography_entry: {title: ''}
        expect(assigns(:entry)).to eq(discography_entry)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:discography_entry){ FactoryGirl.create(:discography_entry) }

    it "destroys the requested entry" do
      delete :destroy, id: discography_entry.permalink
      expect(response).to redirect_to(admin_discography_entries_url)
    end
  end

end

require 'spec_helper'

describe Admin::LinksController do
  before(:each) do
    login_as_mock_user
  end

  describe "GET index" do
    let!(:link){ FactoryGirl.create(:link) }

    it "assigns all links as @links" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET new" do
    it "assigns a new link as @link" do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:link)).to_not be_persisted
    end
  end

  describe "GET edit" do
    let!(:link){ FactoryGirl.create(:link) }

    it "assigns the requested link as @link" do
      get :edit, id: link.id
      expect(response).to have_http_status(:ok)
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created link as @link" do
        post :create, link: {title: 'the title', url: 'http://example.com'}
        expect(response).to redirect_to(admin_links_url)
        expect(assigns(:link)).to be_persisted
        expect(assigns(:link).url).to eq("http://example.com")
        expect(flash[:notice]).to be_present
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        post :create, link: {url: ''}
        expect(assigns(:link)).to_not be_persisted
        expect(response).to have_http_status(:ok)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    let!(:link){ FactoryGirl.create(:link) }

    describe "with valid params" do
      it "updates the requested link" do
        put :update, id: link.id, link: {url: 'http://example.com/new'}
        expect(assigns(:link)).to eq(link)
        expect(response).to redirect_to(admin_links_url)
        expect(assigns(:link).reload.url).to eq('http://example.com/new')
        expect(flash[:notice]).to be_present
      end
    end

    describe "with invalid params" do
      it "assigns the link as @link" do
        put :update, id: link.id, link: {url: ''}
        expect(assigns(:link)).to eq(link)
        expect(response).to have_http_status(:ok)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:link){ FactoryGirl.create(:link) }

    it "destroys the requested link" do
      delete :destroy, id: link.id
      expect(response).to redirect_to(admin_links_url)
    end
  end

  describe "POST sort" do
    it "should be tested" do
      skip
    end
  end
end

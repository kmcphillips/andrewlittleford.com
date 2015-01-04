require 'spec_helper'

describe BlocksController do
  describe "GET contact" do
    let!(:block){ FactoryGirl.create(:block, label: 'contact')}

    it "assigns the requested block as @block" do
      get :contact
      expect(response).to have_http_status(:ok)
      expect(assigns(:block)).to eq(block)
    end
  end

  describe "GET bio" do
    let!(:block){ FactoryGirl.create(:block, label: 'bio')}

    it "assigns the requested block as @block" do
      get :bio
      expect(response).to have_http_status(:ok)
      expect(assigns(:block)).to eq(block)
    end
  end

  describe "GET links" do
    let!(:links){ (0..3).map{ FactoryGirl.create(:link) }.sort_by(&:sort_order) }

    it "assigns the requested block as @block" do
      get :links
      expect(response).to have_http_status(:ok)
      expect(assigns(:block)).to be_nil
      expect(assigns(:links)).to eq(links)
    end
  end

  describe "GET gallery" do
    let!(:block){ FactoryGirl.create(:block, label: 'gallery')}
    let!(:image){ FactoryGirl.create(:image) }

    it "assigns the requested block as @block" do
      get :gallery
      expect(response).to have_http_status(:ok)
      expect(assigns(:block)).to eq(block)
      expect(assigns(:images)).to eq([image])
    end
  end

  describe "GET discography" do
    let!(:entry){ FactoryGirl.create(:discography_entry)}

    it "assigns the requested block as @block" do
      get :discography
      expect(response).to have_http_status(:ok)
      expect(assigns(:entries)).to eq([entry])
    end
  end
end

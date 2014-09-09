require 'spec_helper'

describe Admin::GalleriesController do
  before(:each) do
    login_as_mock_user
  end

  let!(:image){ FactoryGirl.create(:image) }
  let!(:gallery){ image.gallery }

  describe "GET index" do
    it "should load and assign all galleries" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:gallery)).to eq(gallery)
    end
  end
end


require 'spec_helper'

describe Admin::MediasController do
  before(:each) do
    login_as_mock_user
  end

  let!(:media){ FactoryGirl.create(:media) }

  describe "GET edit" do
    it "assigns the requested media as @kit" do
      get :edit, id: media.label
      expect(response).to have_http_status(:ok)
      expect(assigns(:kit)).to eq(media)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested media" do
        put :update, id: media.label, media: {file: ''}
        expect(assigns(:kit)).to eq(media)
        expect(response).to redirect_to(admin_blocks_path)
        expect(flash[:notice]).to be_present
      end
    end
  end
end

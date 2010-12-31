require 'spec_helper'

describe Admin::MediasController do
  before(:each) do
    login_as_mock_user
  end

  def mock_media(stubs={})
    @mock_media ||= mock_model(Media, stubs)
  end

  describe "GET edit" do
    it "assigns the requested media as @kit" do
      Media.stub(:find_by_label!).with("37") { mock_media }
      get :edit, :id => "37"
      assigns(:kit).should be(mock_media)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested media" do
        Media.should_receive(:find_by_label!).with("37") { mock_media }
        mock_media.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :media => {'these' => 'params'}
      end

      it "assigns the requested media as @media" do
        Media.stub(:find_by_label!) { mock_media(:update_attributes => true, :label => "press_kit") }
        put :update, :id => "1"
        assigns(:kit).should be(mock_media)
      end

      it "redirects to the media" do
        Media.stub(:find_by_label!) { mock_media(:update_attributes => true, :label => "press_kit") }
        put :update, :id => "1"
        response.should redirect_to(admin_blocks_path)
      end
    end

    describe "with invalid params" do
      it "assigns the media as @media" do
        Media.stub(:find_by_label!) { mock_media(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:kit).should be(mock_media)
      end

      it "re-renders the 'edit' template" do
        Media.stub(:find_by_label!) { mock_media(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

end

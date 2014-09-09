require 'spec_helper'

describe Admin::ImagesController do
  before(:each) do
    login_as_mock_user
  end

  let!(:image){ FactoryGirl.create(:image) }
  let!(:gallery){ image.gallery }

  describe "POST create" do
    describe "with valid params" do
      it "redirects to the created post" do
        skip
        Image.stub(:new) { mock_image(:save => true)}
        post :create, :image => {}
        response.should redirect_to(admin_galleries_path)
      end
    end

    describe "with invalid params" do
      it "redirects and errors" do
        skip
        Image.stub(:new) { mock_image(:save => false) }
        post :create, :image => {}
        response.should redirect_to(admin_galleries_path)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      skip
      Image.should_receive(:find).with("37") { mock_image }
      mock_image.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the image list" do
      skip
      Image.stub(:find) { mock_image }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_galleries_path)
    end
  end

  describe "POST sort" do
    before(:each) do
      3.times { FactoryGirl.create(:image) }
    end

    it "should sort the IDs passed back" do
      skip
      post :sort, image: [@i3.id ,@i1.id ,@i2.id]
      expect(response).to have_http_status(:ok)
      expect(Image.in_order.map(&:id)).to eq([@i3.id, @i1.id, @i2.id])
    end
  end
end


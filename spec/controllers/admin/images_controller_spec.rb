require 'spec_helper'

describe Admin::ImagesController do
  before(:each) do
    login_as_mock_user
    @gallery = Gallery.create! :name => "Publicity", :path => "publicity", :image => "gallery1.png", :sort_order => 0

    @valid_attributes = {
      :gallery_id => @gallery.id,
      :file_file_name => "test.jpg",
      :file_content_type => "image/jpg", 
      :file_file_size => "12345", 
      :file_updated_at => Time.now, 
      :file_fingerprint => "123094123092093"
      }
  end  

  def mock_image(stubs={})
    @mock_image ||= mock_model(Image, stubs).as_null_object
  end

  describe "POST create" do

    describe "with valid params" do
      it "redirects to the created post" do
        Image.stub(:new) { mock_image(:save => true, :gallery => @gallery) }
        post :create, :image => {}
        response.should redirect_to(admin_gallery_path(@gallery))
      end
    end

    describe "with invalid params" do
      it "redirects and errors" do
        Image.stub(:new) { mock_image(:save => false, :gallery => @gallery) }
        post :create, :image => {}
        response.should redirect_to(admin_gallery_path(@gallery))
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      Image.should_receive(:find).with("37") { mock_image }
      mock_image.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the image list" do
      Image.stub(:find) { mock_image(:gallery => "pie") }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_gallery_path("pie"))
    end
  end

  describe "POST sort" do
    before(:each) do
      @i1 = Image.create! @valid_attributes
      @i2 = Image.create! @valid_attributes
      @i3 = Image.create! @valid_attributes
    end
    
    it "should sort the IDs passed back" do
      post :sort, :image => [3,1,2]
      Image.in_order.map(&:id).should == [@i3.id, @i1.id, @i2.id]
    end
    
    after(:each) do
      Image.destroy_all
      Gallery.destroy_all
    end
  end
end


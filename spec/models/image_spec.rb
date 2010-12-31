require 'spec_helper'

describe Image do

  before(:each) do
    @gallery = Gallery.create! :name => "Publicity", :path => "publicity", :image => "gallery1.png", :sort_order => 0

    @valid_attributes = {
      :gallery => @gallery, 
      :file_file_name => "test.jpg", 
      :file_content_type => "image/jpg", 
      :file_file_size => "12345", 
      :file_updated_at => Time.now, 
      :file_fingerprint => "123094123092093"
      }
  end

  describe "set_sort_order" do
    it "should set the first sort order" do
      i = Image.create!(@valid_attributes)
      i.reload
      i.sort_order.should == 0
    end

    it "should set the next sort order" do
      Image.create!(@valid_attributes)
      i = Image.create!(@valid_attributes)
      i.reload
      i.sort_order.should == 1
    end
    
    after(:each) do
      Image.destroy_all
      Gallery.destroy_all
    end
  end
  
end


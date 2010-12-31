require 'spec_helper'

describe Gallery do
  describe "full_path" do
    it "should build the full path" do
      Gallery.new(:path => "pie").full_path.should == "/galleries/pie"
    end
  end

  describe "image_last_updated_at" do
    it "should lookup the images through named scopes and associations" do
      g = Gallery.new
      i = mock_model(Image, :updated_at => "pie")
      g.images.should_receive(:most_recently_updated).and_return([i])
      g.last_updated_at.should == "pie"
    end
  end
end

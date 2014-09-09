require 'spec_helper'

describe Gallery do
  let(:image){ FactoryGirl.create(:image) }
  let(:gallery){ image.gallery }

  describe "full_path" do
    it "should build the full path" do
      expect(Gallery.new(path: "pie").full_path).to eq("/galleries/pie")
    end
  end

  describe "class methods" do
    before(:each) do
      gallery
    end

    it "should get the singleton" do
      expect(Gallery.singleton).to eq(gallery)
    end
  end
end

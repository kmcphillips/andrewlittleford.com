require 'spec_helper'

describe Image do
  let(:image){ FactoryGirl.create(:image) }
  let(:gallery){ image.gallery }

  describe "set_sort_order" do
    it "should set the first sort order" do
      expect(image.reload.sort_order).to eq(0)
    end

    it "should set the next sort order" do
      image
      expect(FactoryGirl.create(:image, gallery: gallery).reload.sort_order).to eq(1)
    end
  end

  describe "title" do
    it "should return the label if it exists" do
      expect(Image.new(label: "pie").title).to eq("pie")
    end

    it "should return nil if the label is blank" do
      expect(Image.new(label: " ").title).to be_nil
    end
  end
end

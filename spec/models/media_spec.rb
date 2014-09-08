require 'spec_helper'

describe Media do
  describe "to_param" do
    it "should convert label to param" do
      expect(Media.new(label: "pie").to_param).to eq("pie")
    end
  end

  describe "class methods" do
    describe "press_kit" do
      let!(:media){ FactoryGirl.create(:media) }

      it "should find and return" do
        expect(Media.press_kit).to eq(media)
      end
    end
  end
end

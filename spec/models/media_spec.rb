require 'spec_helper'

describe Media do
  describe "to_param" do
    it "should convert label to param" do
      Media.new(:label => "pie").to_param.should == "pie"
    end
  end

  describe "class methods" do
    describe "press_kit" do
      before(:each) do
        @media = mock_model(Media)
      end

      it "should find and return" do
        Media.should_receive(:find_by_label!).with("press_kit").and_return(@media)
        Media.press_kit.should == @media
      end
    end
  end
end

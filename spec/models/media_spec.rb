require 'spec_helper'

describe Media do
  describe "to_param" do
    it "should convert label to param" do
      Media.new(:label => "pie").to_param.should == "pie"
    end
  end
end

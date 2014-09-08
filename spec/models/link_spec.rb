require 'spec_helper'

describe Link do
  let(:link){ FactoryGirl.create(:link) }

  describe "validations" do
    it "should fail with an invalid url" do
      link.url = "pie"
      expect(link).to_not be_valid
    end

    it "should be ok with a valid url" do
      expect(link).to be_valid
    end
  end

  describe "display" do
    it "should show the title if it is there" do
      expect(link.display).to eq(link.title)
    end

    it "should fall back to the url" do
      link.title = nil
      expect(link.display).to eq(link.url)
    end
  end
end

require 'spec_helper'

RSpec.describe DiscographyEntry, type: :model do
  let(:discography_entry){ FactoryGirl.create(:discography_entry) }

  it "should be valid" do
    expect(discography_entry).to be_valid
  end
end

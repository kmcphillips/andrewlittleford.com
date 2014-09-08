require 'spec_helper'

describe Post do
  let(:post){ FactoryGirl.create(:post) }

  it "should know the sort column" do
    expect(post.sort_by).to eq(post.created_at)
  end
end

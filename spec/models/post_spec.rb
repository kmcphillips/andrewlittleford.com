require 'spec_helper'

describe Post do

  it "should know the sort column" do
    t = Time.now
    Post.new(:created_at => t).sort_by.should == t
  end
end

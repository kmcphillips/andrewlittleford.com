require 'spec_helper'

describe PostsController do

  def mock_post(stubs={})
    @mock_post ||= mock_model(Post, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      Post.stub(:paginate) { [mock_post] }
      get :index
      assigns(:posts).should eq([mock_post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      Post.stub(:find_by_permalink!).with("pie") { mock_post }
      get :show, :id => "pie"
      assigns(:post).should be(mock_post)
    end
  end

  describe "GET rss.xml" do
    before(:each) do
      @now = Time.now
      @p1 = Post.create! :title => "post1", :body => "post1"
      @p2 = Post.create! :title => "post2", :body => "post2"
      @p1.update_attribute(:created_at, @now - 2.days)
      @p2.update_attribute(:created_at, @now + 2.days)
      @e1 = Event.create! :title => "event1", :description => "event1", :starts_at => @now - 1.day
      @e2 = Event.create! :title => "event1", :description => "event1", :starts_at => @now + 1.day
    end

    it "should generate the RSS feed" do
      get :rss, :format => :xml
      assigns(:items).should == [@p1, @e1, @e2, @p2]
    end

    after(:each) do
      Post.destroy_all
      Event.destroy_all
    end
  end
end

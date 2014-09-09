require 'spec_helper'

describe PostsController do
  describe "GET index" do
    let!(:post){ FactoryGirl.create(:post) }

    it "assigns all posts as @posts" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET show" do
    let!(:post){ FactoryGirl.create(:post) }

    it "assigns the requested post as @post" do
      get :show, id: post.permalink
      expect(response).to have_http_status(:ok)
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET rss.xml" do
    before(:each) do
      now = Time.now
      @p1 = Post.create! title: "post1", body: "post1"
      @p2 = Post.create! title: "post2", body: "post2"
      @p1.update_attribute(:created_at, now - 2.days)
      @p2.update_attribute(:created_at, now + 2.days)
      @e1 = Event.create! title: "event1", description: "event1", starts_at: now - 1.day
      @e2 = Event.create! title: "event1", description: "event1", starts_at: now + 1.day
    end

    it "should generate the RSS feed" do
      get :rss, format: :xml
      expect(response).to have_http_status(:ok)
      expect(assigns(:items)).to eq([@p1, @e1, @e2, @p2])
    end
  end
end

require 'spec_helper'

describe Admin::PostsController do
  before(:each) do
    login_as_mock_user
  end

  describe "GET index" do
    let!(:post){ FactoryGirl.create(:post) }

    it "assigns all posts as @posts" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:post)).to_not be_persisted
    end
  end

  describe "GET edit" do
    let!(:post){ FactoryGirl.create(:post) }

    it "assigns the requested post as @post" do
      get :edit, id: post.permalink
      expect(response).to have_http_status(:ok)
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created post as @post" do
        post :create, post: { title: 'title', body: 'body'}
        expect(assigns(:post)).to be_persisted
        expect(response).to redirect_to(admin_posts_url)
        expect(flash[:notice]).to be_present
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, post: {title: ''}
        expect(response).to have_http_status(:ok)
        expect(response).to render_template("new")
        expect(assigns(:post)).to_not be_persisted
      end
    end
  end

  describe "PUT update" do
    let!(:post){ FactoryGirl.create(:post) }

    describe "with valid params" do
      it "updates the requested post" do
        put :update, id: post.permalink, post: {title: 'new title', body: 'new body'}
        expect(assigns(:post).title).to eq('new title')
        expect(assigns(:post).body).to eq('new body')
        expect(response).to redirect_to(admin_posts_url)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        put :update, id: post.permalink, post: {title: ''}
        expect(response).to have_http_status(:ok)
        expect(response).to render_template("edit")
        expect(assigns(:post)).to eq(post)
      end
    end
  end

  describe "DELETE destroy" do
    let!(:post){ FactoryGirl.create(:post) }

    it "destroys the requested post" do
      delete :destroy, id: post.permalink
      expect(response).to redirect_to(admin_posts_url)
    end
  end
end

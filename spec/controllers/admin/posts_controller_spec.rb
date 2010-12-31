require 'spec_helper'

describe Admin::PostsController do
  before(:each) do
    login_as_mock_user
  end  

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

  describe "GET new" do
    it "assigns a new post as @post" do
      Post.stub(:new) { mock_post }
      get :new
      assigns(:post).should be(mock_post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      Post.stub(:find_by_permalink!).with("37") { mock_post }
      get :edit, :id => "37"
      assigns(:post).should be(mock_post)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created post as @post" do
        Post.stub(:new).with({'these' => 'params'}) { mock_post(:save => true) }
        post :create, :post => {'these' => 'params'}
        assigns(:post).should be(mock_post)
      end

      it "redirects to the created post" do
        Post.stub(:new) { mock_post(:save => true) }
        post :create, :post => {}
        response.should redirect_to(admin_posts_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        Post.stub(:new).with({'these' => 'params'}) { mock_post(:save => false) }
        post :create, :post => {'these' => 'params'}
        assigns(:post).should be(mock_post)
      end

      it "re-renders the 'new' template" do
        Post.stub(:new) { mock_post(:save => false) }
        post :create, :post => {}
        response.should render_template("new")
      end
    end
    
    describe "preview" do
      it "should check the commit and preview" do
        Post.stub(:new).with({'these' => 'params'}) { mock_post }
        mock_post.should_receive(:valid?)
        post :create, :post => {'these' => 'params'}, :commit => "Preview"
        assigns(:post).should be(mock_post)
        assigns(:preview).should be_true
      end

      it "should render" do
        Post.stub(:new).with({'these' => 'params'}) { mock_post(:valid? => true) }
        post :create, :post => {'these' => 'params'}, :commit => "Preview"
        response.should render_template("edit")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested post" do
        Post.should_receive(:find_by_permalink!).with("37") { mock_post }
        mock_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post => {'these' => 'params'}
      end

      it "assigns the requested post as @post" do
        Post.stub(:find_by_permalink!) { mock_post(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:post).should be(mock_post)
      end

      it "redirects to the post" do
        Post.stub(:find_by_permalink!) { mock_post(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_posts_url)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        Post.stub(:find_by_permalink!) { mock_post(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:post).should be(mock_post)
      end

      it "re-renders the 'edit' template" do
        Post.stub(:find_by_permalink!) { mock_post(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

    describe "preview" do
      it "should check the commit and preview" do
        Post.stub(:find_by_permalink!) { mock_post }
        mock_post.should_receive(:attributes=)
        mock_post.should_receive(:valid?)
        put :update, :id => "1", :commit => "Preview"
        assigns(:post).should be(mock_post)
        assigns(:preview).should be_true
      end
      
      it "should render" do
        Post.stub(:find_by_permalink!) { mock_post(:attributes= => true, :valid? => nil) }
        put :update, :id => "1", :commit => "Preview"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      Post.should_receive(:find_by_permalink!).with("37") { mock_post }
      mock_post.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the posts list" do
      Post.stub(:find_by_permalink!) { mock_post }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_posts_url)
    end
  end

end

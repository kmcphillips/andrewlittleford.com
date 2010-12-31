require 'spec_helper'

describe Admin::SessionsController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end

  describe "GET new" do
    it "should redirect if you are already logged in" do
      controller.current_user(mock_user)
      get :new
      response.should redirect_to("/admin")
    end
    
    it "should just be cool if you want to login" do
      get :new
      response.should_not redirect_to("/admin")
    end
  end

  describe "POST create" do
    it "should authenticate" do
      User.should_receive(:authenticate).and_return(mock_user)
      post :create
      response.should redirect_to("/admin")
    end

    it "should not authenticate" do
      User.should_receive(:authenticate)
      post :create
      response.should redirect_to("/admin/login")
    end
  end

  describe "POST logout" do
    it "should clear the current user" do
      controller.current_user(mock_user)
      post :logout
      flash[:notice].should_not be_blank
    end
    
    it "should not flash if you are not logged in" do
      post :logout
      flash[:notice].should be_blank
    end
  end
  
  describe "GET password" do
    before(:each) do
      controller.current_user(mock_user)
    end
    
    it "should just load" do
      get :password
      response.should be_successful
    end
  end
  
  describe "POST change_password" do
    before(:each) do
      controller.current_user(mock_user)
    end
    
    it "should set the password" do
      mock_user.should_receive(:change_password!).with("pie", "pie").and_return(true)
      post :change_password, :password => "pie", :password_confirm => "pie"
      response.should redirect_to(password_admin_sessions_path)
      flash[:notice].should_not be_blank
    end
    
    it "should fail to set the password" do
      mock_user.stub(:errors => mock(:errors, :full_messages => ["errors"]))
      mock_user.should_receive(:change_password!).with("pie", "cake").and_return(false)
      post :change_password, :password => "pie", :password_confirm => "cake"
      response.should redirect_to(password_admin_sessions_path)
      flash[:error].should_not be_blank
    end
  end

end

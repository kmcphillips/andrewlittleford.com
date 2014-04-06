require 'spec_helper'

describe Authentication do
  before(:each) do
    # This doesn't pass the smell test but it works
    @controller = Object.new.extend Authentication
    @controller.stub(:session => {})
  end

  describe "current_user" do
    before(:each) do
      @u = User.create! :username => "km", :name => "Kevin McPhillips", :email => "km@kevinmcphillips.ca", :password_hash => "pie"
    end

    describe "with a logged in user" do
      it "should find the user" do
        @controller.session[:current_user] = @u.id
        @controller.current_user.should == @u
      end

      it "should find the user" do
        User.should_not_receive(:find_by_id)
        @controller.current_user(@u)
        @controller.current_user
      end

      it "should set the user" do
        @controller.current_user(@u)
        @controller.current_user.should == @u
      end

      it "should raise if you call it with something else" do
        lambda{ @controller.current_user(double) }.should raise_error
      end
    end

    describe "without a logged in user" do
      it "should not find it" do
        @controller.current_user.should be_nil
      end

      it "should set the user" do
        @controller.current_user(@u)
        @controller.session[:current_user].should == @u.id
      end
    end

    after(:each) do
      User.delete_all
    end
  end

  describe "clear_current_user" do
    it "should clear it out" do
      @controller.session[:current_user] = "pie"
      @controller.clear_current_user
      @controller.current_user.should be_nil
    end
  end

end

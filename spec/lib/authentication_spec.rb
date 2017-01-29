require 'spec_helper'

describe Authentication do
  before(:each) do
    # This doesn't pass the smell test but it works
    @controller = Object.new.extend Authentication
    allow(@controller).to receive(:session).and_return({})
  end

  describe "current_user" do
    let!(:user){ FactoryGirl.create(:user) }

    describe "with a logged in user" do
      it "should find the user" do
        @controller.session[:current_user] = user.id
        expect(@controller.current_user).to eq(user)
      end

      it "should set the user" do
        @controller.current_user(user)
        expect(@controller.current_user).to eq(user)
      end

      it "should raise if you call it with something else" do
        expect(->{ @controller.current_user(double) }).to raise_error(ArgumentError)
      end
    end

    describe "without a logged in user" do
      it "should not find it" do
        expect(@controller.current_user).to be_nil
      end

      it "should set the user" do
        @controller.current_user(user)
        expect(@controller.session[:current_user]).to eq(user.id)
      end
    end
  end

  describe "clear_current_user" do
    it "should clear it out" do
      @controller.session[:current_user] = "pie"
      @controller.clear_current_user
      expect(@controller.current_user).to be_nil
    end
  end

end

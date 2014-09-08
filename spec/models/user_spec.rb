require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  describe "authenticate" do
    it "should find a user by name and password_hash" do
      expect(User.authenticate(username: user.username, password: "password")).to eq(user)
    end

    it "should be nil with a unknown user" do
      expect(User.authenticate(username: "junk", password: "password")).to be_nil
    end

    it "should find a user by name and password_hash with a confirm password" do
      expect(User.authenticate(username: user.username, password: "password", password_confirm: "password")).to eq(user)
    end

    it "should not find a user because of invalid username or password" do
      expect(User.authenticate(username: user.username, password: "password", password_confirm: "cake")).to be_nil
    end
  end

  describe "encrypt" do
    it "should encrypt the password into a hash" do
      expect(user.password_hash).to eq(Digest::SHA1.hexdigest('password'))
    end
  end
end

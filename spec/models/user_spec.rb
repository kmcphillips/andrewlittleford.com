require 'spec_helper'

describe User do
  before(:each) do
    @u = User.new(:username => "km", :password_hash => "1234567890abcdef")
  end

  it "should create a new instance" do
    @u.save.should be_true
  end

  it "should fail to create without a username" do
    u = User.new(:password_hash => "1234567890abcdef")
    u.save.should be_false
  end

  it "should fail to create without a password_hash" do
    u = User.new(:username => "km")
    u.save.should be_false
end

  describe "authenticate" do
    before(:each) do
      User.stub!(:encrypt).with("pie").and_return("pie_encrypted")
    end

    it "should find a user by name and password_hash" do
      User.should_receive(:first).with(:conditions => ["username = ? AND password_hash = ?", "km", "pie_encrypted"]).and_return(@u)
      User.authenticate(:username => "km", :password => "pie").should == @u
    end

    it "should find a user by name and password_hash with a confirm password" do
      User.should_receive(:first).with(:conditions => ["username = ? AND password_hash = ?", "km", "pie_encrypted"]).and_return(@u)
      User.authenticate(:username => "km", :password => "pie", :password_confirm => "pie").should == @u
    end

    it "should not find a user if the password_confirm does not match" do
      User.should_receive(:first).with(:conditions => ["username = ? AND password_hash = ?", "km", "pie_encrypted"]).and_return(nil)
      User.authenticate(:username => "km", :password => "pie", :password_confirm => "pie").should == nil
    end

    it "should not find a user because of invalid username or password" do
      User.should_not_receive(:first)
      User.authenticate(:username => "km", :password => "pie", :password_confirm => "cake").should == nil
    end
  end

  describe "encrypt" do
    it "should encrypt the password into a hash" do
      Digest::SHA1.should_receive(:hexdigest).with("pie").and_return("delicious")
      User.encrypt("pie").should == "delicious"
    end
  end

  after(:each) do
    User.delete_all
  end
end

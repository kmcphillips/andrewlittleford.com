require 'spec_helper'

describe ApplicationHelper do
  include ApplicationHelper
  
  describe "page title" do
    it "should build a default page title" do
      self.stub!(:params).and_return(:controller => "pie")
      instance_variable_set('@title', "Cake")
      page_title.should == "#{PAGE_TITLE} - Cake"
    end
    
    it "should build a title from the controller" do
      self.stub!(:params).and_return(:controller => "pie")
      page_title.should == "#{PAGE_TITLE} - Pie"
    end

    it "should build a page title for your controller" do
      self.stub!(:params).and_return(:controller => "pie")
      self.instance_variable_set('@title', "Delicious")
      page_title.should == "#{PAGE_TITLE} - Delicious"
    end

    it "should show default admin" do
      self.stub!(:params).and_return(:controller => "admin/pie")
      page_title.should == "#{PAGE_TITLE} - Admin"
    end
    
    it "should prepend admin if you are under admin" do
      self.stub!(:params).and_return(:controller => "admin/pie")
      self.instance_variable_set('@title', "Delicious")
      page_title.should == "#{PAGE_TITLE} - Admin - Delicious"
    end
    
    it "should makes special exception for the blocks controller" do
      self.stub!(:params).and_return(:controller => "blocks", :action => "eat")
      page_title.should == "#{PAGE_TITLE} - Eat"
    end

    it "should do the same for blocks controller under admin" do
      self.stub!(:params).and_return(:controller => "admin/blocks", :action => "eat")
      page_title.should == "#{PAGE_TITLE} - Admin - Eat"
    end
  end
  
  describe "error messages" do
    it "should render the partial" do
      obj = mock :object
      should_receive(:render).with(:partial => "/shared/error_messages", :object => obj)
      error_messages(obj)
    end
  end

  describe "admin?" do
    it "should know if it is not admin" do
      stub!(:params => {:controller => "posts"})
      admin?.should be_false
    end

    it "should know if it is admin" do
      stub!(:params => {:controller => "admin/posts"})
      admin?.should be_true
    end
  end

  describe "image link helpers" do
    it "should be tested" do
      pending "new/edit/delete/index icon helpers"
    end
  end
end

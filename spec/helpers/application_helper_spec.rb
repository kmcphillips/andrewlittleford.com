require 'spec_helper'

describe ApplicationHelper do
  describe "page title" do
    it "should build a default page title" do
      helper.stub(:params).and_return(:controller => "pie")
      helper.instance_variable_set('@title', "Cake")
      helper.page_title.should == "#{PAGE_TITLE} :: Cake"
    end
    
    it "should build a title from the controller" do
      helper.stub(:params).and_return(:controller => "pie")
      helper.page_title.should == "#{PAGE_TITLE} :: Pie"
    end

    it "should build a page title for your controller" do
      helper.stub(:params).and_return(:controller => "pie")
      helper.instance_variable_set('@title', "Delicious")
      helper.page_title.should == "#{PAGE_TITLE} :: Delicious"
    end

    it "should show default admin" do
      helper.stub(:params).and_return(:controller => "admin/pie")
      helper.page_title.should == "#{PAGE_TITLE} :: Admin"
    end
    
    it "should prepend admin if you are under admin" do
      helper.stub(:params).and_return(:controller => "admin/pie")
      helper.instance_variable_set('@title', "Delicious")
      helper.page_title.should == "#{PAGE_TITLE} :: Admin :: Delicious"
    end
    
    it "should makes special exception for the blocks controller" do
      helper.stub(:params).and_return(:controller => "blocks", :action => "eat")
      helper.page_title.should == "#{PAGE_TITLE} :: Eat"
    end

    it "should do the same for blocks controller under admin" do
      helper.stub(:params).and_return(:controller => "admin/blocks", :action => "eat")
      helper.page_title.should == "#{PAGE_TITLE} :: Admin :: Eat"
    end
  end
  
  describe "error messages" do
    it "should render the partial" do
      obj = double :object
      helper.should_receive(:render).with(:partial => "/shared/error_messages", :object => obj)
      helper.error_messages(obj)
    end
  end

  describe "admin?" do
    it "should know if it is not admin" do
      helper.stub(:params => {:controller => "posts"})
      helper.admin?.should be_false
    end

    it "should know if it is admin" do
      helper.stub(:params => {:controller => "admin/posts"})
      helper.admin?.should be_true
    end
  end

  describe "image for" do
    it "should return nil if the object has no image" do
      helper.image_for(Post.new).should be_nil
    end
  end
end

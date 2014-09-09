require 'spec_helper'

describe ApplicationHelper do
  describe "page title" do
    it "should build a default page title" do
      allow(helper).to receive(:params).and_return(controller: "pie")
      helper.instance_variable_set('@title', "Cake")
      expect(helper.page_title).to eq("#{PAGE_TITLE} :: Cake")
    end

    it "should build a title from the controller" do
      allow(helper).to receive(:params).and_return(controller: "pie")
      expect(helper.page_title).to eq("#{PAGE_TITLE} :: Pie")
    end

    it "should build a page title for your controller" do
      allow(helper).to receive(:params).and_return(controller: "pie")
      helper.instance_variable_set('@title', "Delicious")
      expect(helper.page_title).to eq("#{PAGE_TITLE} :: Delicious")
    end

    it "should show default admin" do
      allow(helper).to receive(:params).and_return(controller: "admin/pie")
      expect(helper.page_title).to eq("#{PAGE_TITLE} :: Admin")
    end

    it "should prepend admin if you are under admin" do
      allow(helper).to receive(:params).and_return(controller: "admin/pie")
      helper.instance_variable_set('@title', "Delicious")
      expect(helper.page_title).to eq("#{PAGE_TITLE} :: Admin :: Delicious")
    end

    it "should makes special exception for the blocks controller" do
      allow(helper).to receive(:params).and_return(controller: "blocks", action: "eat")
      expect(helper.page_title).to eq("#{PAGE_TITLE} :: Eat")
    end

    it "should do the same for blocks controller under admin" do
      allow(helper).to receive(:params).and_return(controller: "admin/blocks", action: "eat")
      expect(helper.page_title).to eq("#{PAGE_TITLE} :: Admin :: Eat")
    end
  end

  describe "error messages" do
    it "should render the partial" do
      obj = double :object
      expect(helper).to receive(:render).with(partial: "/shared/error_messages", object: obj)
      helper.error_messages(obj)
    end
  end

  describe "admin?" do
    it "should know if it is not admin" do
      allow(helper).to receive(:params).and_return(controller: "posts")
      expect(helper.admin?).to be_falsy
    end

    it "should know if it is admin" do
      allow(helper).to receive(:params).and_return(controller: "admin/posts")
      expect(helper.admin?).to be_truthy
    end
  end

  describe "image for" do
    it "should return nil if the object has no image" do
      expect(helper.image_for(Post.new)).to be_nil
    end
  end
end

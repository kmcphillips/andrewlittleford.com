require 'spec_helper'

describe BlocksController do

  def mock_block(stubs={})
    @mock_block ||= mock_model(Block, stubs).as_null_object
  end

  describe "GET contact" do
    it "assigns the requested block as @block" do
      Block.stub(:find_by_label).with("contact") { mock_block }
      get "contact"
      assigns(:block).should be(mock_block)
    end
  end

  describe "GET bio" do
    it "assigns the requested block as @block" do
      @media = mock_model(Media)
      Block.stub(:find_by_label).with("bio") { mock_block }
      Media.stub(:find_by_label! => @media)
      get "bio"
      assigns(:block).should be(mock_block)
      assigns(:kit).should be(@media)
    end
  end

  describe "GET links" do
    it "assigns the requested block as @block" do
      Block.stub(:find_by_label).with("links")
      Link.should_receive(:in_order).and_return(["links"])
      get "links"
      assigns(:block).should be(nil)
      assigns(:links).should == ["links"]
    end
  end

end

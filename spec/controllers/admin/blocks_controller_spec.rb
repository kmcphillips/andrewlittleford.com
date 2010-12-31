require 'spec_helper'

describe Admin::BlocksController do
  before(:each) do
    login_as_mock_user
  end

  def mock_block(stubs={})
    @mock_block ||= mock_model(Block, stubs)
  end

  describe "GET index" do
    it "assigns all blocks as @blocks" do
      Block.stub(:order) { [mock_block] }
      get :index
      assigns(:blocks).should eq([mock_block])
    end
  end

  describe "GET edit" do
    it "assigns the requested block as @block" do
      Block.stub(:find).with("37") { mock_block }
      get :edit, :id => "37"
      assigns(:block).should be(mock_block)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested block" do
        Block.should_receive(:find).with("37") { mock_block }
        mock_block.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :block => {'these' => 'params'}
      end

      it "assigns the requested block as @block" do
        Block.stub(:find) { mock_block(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:block).should be(mock_block)
      end

      it "redirects to the block" do
        Block.stub(:find) { mock_block(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_blocks_path)
      end
    end

    describe "with invalid params" do
      it "assigns the block as @block" do
        Block.stub(:find) { mock_block(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:block).should be(mock_block)
      end

      it "re-renders the 'edit' template" do
        Block.stub(:find) { mock_block(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

end

require 'spec_helper'

describe Admin::BlocksController do
  before(:each) do
    login_as_mock_user
  end

  let!(:block){ FactoryGirl.create(:block) }
  let!(:media){ FactoryGirl.create(:media) }
  let(:blocks){ [block] }
  let(:medias){ [media] }

  describe "GET index" do
    it "assigns all blocks as @blocks" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:blocks)).to eq(blocks)
      expect(assigns(:medias)).to eq(medias)
    end
  end

  describe "GET edit" do
    it "assigns the requested block as @block" do
      get :edit, id: block.id
      expect(response).to have_http_status(:ok)
      expect(assigns(:block)).to eq(block)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested block" do
        put :update, id: block.id, block: {body: "changed"}
        expect(response).to redirect_to(admin_blocks_path)
        expect(block.reload.body).to eq("changed")
        expect(flash[:notice]).to be_present
      end
    end

    describe "with invalid params" do
      it "assigns renders and errors" do
        expect(Block).to receive(:find).with(block.id.to_s).and_return(block)
        expect(block).to receive(:update_attributes).and_return(false)
        put :update, id: block.id, block: {body: 'asdf'}
        expect(assigns(:block)).to eq(block)
        expect(response).to have_http_status(:ok)
        expect(response).to render_template("edit")
      end
    end
  end
end

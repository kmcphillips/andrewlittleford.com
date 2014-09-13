require 'spec_helper'

describe Admin::ImagesController do
  before(:each) do
    login_as_mock_user
  end

  let!(:image){ FactoryGirl.create(:image) }
  let(:file){ fixture_file_upload('pie.jpg', 'image/jpg') }

  describe "GET index" do
    it "should render the index " do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:images)).to eq([image])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "redirects to the created post" do
        expect{
          post :create, image: {label: 'test', file: file}
          expect(response).to redirect_to(admin_images_path)
          expect(flash[:notice]).to be_present
        }.to change{ Image.count }.by(1)
      end
    end

    describe "with invalid params" do
      it "redirects and errors" do
        expect{
          post :create, image: {label: 'test', file: nil}
          expect(response).to redirect_to(admin_images_path)
          expect(flash[:error]).to be_present
        }.to_not change{ Image.count }
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "should update the image and redirect" do
        put :update, id: image.id, image: {label: 'new label'}
        expect(response).to redirect_to(admin_images_path)
        expect(flash[:notice]).to be_present
        expect(image.reload.label).to eq('new label')
      end
    end

    describe "with invalid params" do
      it "should redirect and flash" do
        put :update, id: image.id, image: {file: nil}
        expect(response).to redirect_to(admin_images_path)
        expect(flash[:error]).to be_present
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      expect{
        delete :destroy, id: image.id
        expect(response).to redirect_to(admin_images_path)
      }.to change{ Image.count }.by(-1)
    end
  end

  describe "POST sort" do
    before(:each) do
      3.times { FactoryGirl.create(:image) }
    end

    let(:images){ Image.all.to_a }
    let(:image_ids){ [images[1].id, images[0].id, images[3].id, images[2].id] }

    it "should sort the IDs passed back" do
      post :sort, image: image_ids
      expect(response).to have_http_status(:ok)
      expect(Image.in_order.map(&:id)).to eq(image_ids)
    end
  end
end


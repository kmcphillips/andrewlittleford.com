require 'spec_helper'

describe TracksController do
  let(:track){ FactoryGirl.create(:track) }

  describe "GET show" do
    it "assigns the requested track as @track" do
      get :show, id: track.id
      expect(assigns(:track)).to eq(track)
      expect(assigns(:tracks)).to eq([track])
    end
  end

end

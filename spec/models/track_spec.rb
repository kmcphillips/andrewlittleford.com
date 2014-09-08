require 'spec_helper'

describe Track do
  let(:track){ FactoryGirl.create(:track) }

  it "should set the sort order when there are no others" do
    expect(track.sort_order).to eq(1)
  end

  it "should increment from the highest object" do
    track
    expect(FactoryGirl.create(:track).reload.sort_order).to eq(2)
  end

  it "should know the mp3_url" do
    skip
    expect(track.mp3_url("http://pie:123/player/1")).to eq("http://pie:123/assets/pie.mp3")
  end

  describe "with real data" do
    let(:all){ Track.order("sort_order ASC") }

    before(:each) do
      3.times{ FactoryGirl.create(:track) }
    end

    describe "adjacent track" do
      it "should know for the first track what is adjacent" do
        t = all.first
        expect(t.next.sort_order).to eq(2)
        expect(t.previous.sort_order).to eq(all.last.sort_order)
      end

      it "should know for the second track what is adjacent" do
        t = all[1]
        expect(t.next.sort_order).to eq(3)
        expect(t.previous.sort_order).to eq(1)
      end

      it "should know for the last track what is adjacent" do
        t = all.last
        expect(t.next.sort_order).to eq(1)
        expect(t.previous.sort_order).to eq(t.sort_order - 1)
      end

      it "should return nil if there is only one track" do
        Track.destroy_all
        expect(track.next).to be_nil
        expect(track.previous).to be_nil
      end
    end

    describe "number_from_total" do
      it "should know the order for all tracks" do
        all.each_with_index do |t, i|
          expect(t.number_from_total).to eq("(#{i + 1} of #{ all.length })")
        end
      end
    end
  end

  describe "class methods" do
    describe "window name" do
      it "should form the window name" do
        expect(Track.window_name).to eq("_andrew_littleford_player")
      end
    end

    describe "highest sort order" do

      it "should know the highest number" do
        4.times{ FactoryGirl.create(:track) }
        expect(Track.highest_sort_order).to eq(4)
      end
    end

    describe "beginning" do
      it "should find the first track" do
        1.times{ FactoryGirl.create(:track) }
        expect(Track.beginning.sort_order).to eq(1)
      end
    end
  end

end

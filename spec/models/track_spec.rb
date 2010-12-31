require 'spec_helper'

describe Track do
  before(:each) do
    @valid_attributes = {:title => "filename", :sort_order => 1, :mp3_file_name => "filename", :mp3_content_type => "audio/mpeg", :mp3_file_size => 1.megabyte, :mp3_updated_at => Time.now}
  end

  it "should set the sort order when there are no others" do
    t = Track.new
    t.valid?
    t.sort_order.should == 1
  end

  it "should increment from the highest object" do
    Track.create! @valid_attributes
    t = Track.new
    t.valid?
    t.sort_order.should == 2
  end
  
  it "should know the mp3_url" do
    t = Track.new
    t.stub(:mp3 => mock(:mp3, :url => "/assets/pie.mp3", :exists? => true))
    t.mp3_url("http://pie:123/player/1").should == "http://pie:123/assets/pie.mp3"
  end
  
  describe "with real data" do
    before(:each) do
      (0..3).each do
        Track.create! @valid_attributes.merge(:sort_order => nil)
        @all = Track.order("sort_order ASC")
      end
    end
   
    describe "adjacent track" do 
      it "should know for the first track what is adjacent" do
        t = @all.first
        t.next.sort_order.should == 2
        t.previous.sort_order.should == @all.last.sort_order
      end

      it "should know for the second track what is adjacent" do
        t = @all[1]
        t.next.sort_order.should == 3
        t.previous.sort_order.should == 1
      end

      it "should know for the last track what is adjacent" do
        t = @all.last
        t.next.sort_order.should == 1
        t.previous.sort_order.should == t.sort_order - 1
      end
      
      it "should return nil if there is only one track" do
        t = @all.pop
        @all.map(&:destroy)
        t.next.should be_nil
        t.previous.should be_nil
      end
    end

    describe "number_from_total" do
      it "should know the order for all tracks" do
        tracks = Track.order("sort_order ASC")

        tracks.each_with_index do |t, i|
          t.number_from_total.should == "(#{i + 1} of #{tracks.length})" 
        end
      end
    end
    
    after(:each) do
      Track.destroy_all
    end
  end
  
  describe "class methods" do
    describe "window name" do
      it "should form the window name" do
        Track.window_name.should == "_andrew_littleford_player"
      end
    end
    
    describe "highest sort order" do
      before(:each) do
        (0..3).each do
          Track.create! @valid_attributes.merge(:sort_order => nil)
        end
      end
      
      it "should know the highest number" do
        Track.highest_sort_order.should == 4
      end
      
      after(:each) do
        Track.destroy_all
      end
    end
    
    describe "beginning" do
      before(:each) do
        (1..3).each do |sort_order|
          Track.create! @valid_attributes.merge(:sort_order => sort_order)
        end
      end
      
      it "should find the first track" do
        Track.beginning.sort_order.should == 1
      end
      
      after(:each) do
        Track.destroy_all
      end
    end
  end
  
end

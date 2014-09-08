require 'spec_helper'

describe Event do
  let(:event){ FactoryGirl.create(:event) }
  let(:now){ Time.now }

  before(:each) do
    Timecop.freeze
  end

  describe "with real events" do
    let!(:upcoming){ FactoryGirl.create(:event, starts_at: now + 3.days) }
    let!(:current){ FactoryGirl.create(:event, starts_at: now - 1.hour) }
    let!(:past){ FactoryGirl.create(:event, starts_at: now - 1.day) }

    describe "scopes" do
      it "should find the upcoming events" do
        expect(Event.upcoming).to eq([upcoming])
      end

      it "should find the current event" do
        expect(Event.current).to eq([current])
      end

      it "should find the past events" do
        expect(Event.past).to eq([past])
      end
    end

    describe "status" do
      it "should know it is upcoming" do
        expect(upcoming.status).to eq("Upcoming")
      end

      it "should know it is current" do
        expect(current.status).to eq("Current")
      end

      it "should know it is past" do
        expect(past.status).to eq("Past")
      end
    end

    describe "current?" do
      it "should know the current event" do
        expect(current.current?).to be_truthy
      end

      it "should know the others are not current" do
        expect(past.current?).to be_falsy
        expect(upcoming.current?).to be_falsy
      end
    end

    describe "upcoming?" do
      it "should know the upcoming event" do
        expect(upcoming.upcoming?).to be_truthy
      end

      it "should know the others are not upcoming" do
        expect(past.upcoming?).to be_falsy
        expect(current.upcoming?).to be_falsy
      end
    end

    describe "past?" do
      it "should know the past event" do
        expect(past.past?).to be_truthy
      end

      it "should know the others are not past" do
        expect(upcoming.past?).to be_falsy
        expect(current.past?).to be_falsy
      end
    end
  end
end

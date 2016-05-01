require 'spec_helper'

describe TheTracker::Tracker do
  describe "methods" do
    describe "add" do
      it 'returns registered trackers' do
        described_class.reset
        described_class.config do |tmf|
          tmf.add double('Object', :header => 'my tracker', :name => :track_test)
        end
        described_class.instance.add double('Object', :header => 'other tracker', :name => :track_test2)
        expect(described_class.instance.trackers.size).to eq(2)
      end
    end

    describe "add_once" do
      before :each do
        test_tr = double('Object', :body_bottom => 'my tracker', :name => :track_test)
        described_class.reset
        described_class.config do |tmf|
          tmf.add test_tr
        end
        test_tr2 = double('Object', :body_bottom => 'other tracker', :name => :track_test2)
        described_class.instance.add_once test_tr2
      end

      it 'register a new tracker' do
        expect(described_class.instance.trackers.size).to eq(2)
      end

      it 'deregister the tracker after it has been injected on a page' do
        expect(described_class.instance.trackers.size).to eq(2)
        described_class.instance.body_bottom
        expect(described_class.instance.trackers.size).to eq(1)
      end
    end

    describe "header" do
      before :each do
        ga = double('Object', :header => 'google analytics', :name => :ganalytics)
        tracker = TheTracker::Tracker.clone
        @tracker = tracker.instance
        @tracker.add ga
      end

      it 'returns all headers from trackers' do
        expect(@tracker.header).to eq('google analytics')
      end

      it 'adds headers of new tracker' do
        sc = double('Object', :header => 'site catalist', :name => :sitecat)
        allow(sc).to receive(:header).and_return('site catalist')
        @tracker.add sc
        expect(@tracker.header).to eq("google analytics\nsite catalist")
      end

      it 'should not render nil trackers' do
        ss = double('Object', :header => 'site nil', :name => :stupid_site)
        allow(ss).to receive(:header).and_return(nil)
        @tracker.add ss
        expect(@tracker.header).to eq('google analytics')
      end
    end

    describe "body_top" do
      before :each do
        ga = double('Object', :body_top => 'google analytics', :name => :ganalytics)
        tracker = TheTracker::Tracker.clone
        @tracker = tracker.instance
        @tracker.add ga
      end

      it 'returns body_top from trackers' do
        expect(@tracker.body_top).to eq('google analytics')
      end

      it 'adds new tracker' do
        sc = double('Object', :body_top => 'site catalist', :name => :sitecat)
        allow(sc).to receive(:body_top).and_return('site catalist')
        @tracker.add sc
        expect(@tracker.body_top).to eq("google analytics\nsite catalist")
      end

      it 'should not render nil trackers' do
        ss = double('Object', :body_top => 'site nil', :name => :stupid_site)
        allow(ss).to receive(:body_top).and_return(nil)
        @tracker.add ss
        expect(@tracker.body_top).to eq('google analytics')
      end
    end

    describe "body_bottom" do
      before :each do
        ga = double('Object', :body_bottom => 'google analytics', :name => :ganalytics)
        tracker = TheTracker::Tracker.clone
        @tracker = tracker.instance
        @tracker.add ga
      end

      it 'returns body_bottom from trackers' do
        expect(@tracker.body_bottom).to eq('google analytics')
      end

      it 'adds new tracker' do
        sc = double('Object', :body_bottom => 'site catalist', :name => :sitecat)
        allow(sc).to receive(:body_bottom).and_return('site catalist')
        @tracker.add sc
        expect(@tracker.body_bottom).to eq("google analytics\nsite catalist")
      end

      it 'should not render nil trackers' do
        ss = double('Object', :body_bottom => 'site nil', :name => :stupid_site)
        allow(ss).to receive(:body_bottom).and_return(nil)
        @tracker.add ss
        expect(@tracker.body_bottom).to eq('google analytics')
      end
    end
  end
end

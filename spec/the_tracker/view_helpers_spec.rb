require 'spec_helper'

describe 'View Helpers' do
  class GAnalitics < TheTracker::Trackers::Base
    def header
      'header tracking code'
    end

    def body_top
      'body top tracking code'
    end

    def body_bottom
      'body bottom tracking code'
    end

    def name
      :ganalytics
    end
  end

  class ViewClass
    include TheTracker::ViewHelpers
  end

  before :each do
    TheTracker::Tracker.reset
    TheTracker::Tracker.config do |tmf|
      tmf.add GAnalitics.new
    end
  end

  let(:vc) { ViewClass.new }

  describe 'Header' do
    it 'display header info' do
      expect(vc.header_tracking_code).to eq('header tracking code')
    end
  end

  describe 'Body Top' do
    it 'display top info' do
      expect(vc.body_top_tracking_code).to eq('body top tracking code')
    end
  end

  describe 'Body Bottom' do
    it 'display bottom info' do
      expect(vc.body_bottom_tracking_code).to eq('body bottom tracking code')
    end
  end
end

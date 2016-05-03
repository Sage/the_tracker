require 'spec_helper'

describe TheTracker::Trackers::AdForm do
  subject { described_class.new(:pm => '111666', :id => '333555') }
  describe "methods" do
    describe "header" do
      it 'should return ad_form content' do
        expect(subject.header).to include('https://track.adform.net/serving/scripts/trackpoint/async/')
      end

      it 'should include pm and id information' do
        expect(subject.header).to include('pm: 111666')
        expect(subject.header).to include('id: 333555')
      end

      it 'returns nothing if tracker not active' do
        subject.active = false
        expect(subject.header).to eq(nil)
      end
    end
  end
end

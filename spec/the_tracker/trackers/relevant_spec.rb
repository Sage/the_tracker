require 'spec_helper'

describe TheTracker::Trackers::Relevant do
  subject { described_class.new(:token => 12345678, :seg => '9876543', :orderId => '2') }
  describe "methods" do
    describe "body_bottom" do
      it 'should return ad_form content' do
        expect(subject.body_bottom).to include('://ib.adnxs.com/px')
      end

      it 'should include id, seg and orderID' do
        expect(subject.body_bottom).to include("id=12345678");
        expect(subject.body_bottom).to include("seg=9876543");
        expect(subject.body_bottom).to include("orderId=2");
      end

      it 'returns nothing if tracker not active' do
        subject.active = false
        expect(subject.body_bottom).to eq(nil)
      end
    end
  end
end

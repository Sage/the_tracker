require 'spec_helper'

describe TheTracker::Trackers::Smart4Ads do
  subject { described_class.new(scriptId: 12345678, accountId: '9876543', totalCost: '0.00', orderId: 'PPEE44', actionCode: 'XX0099') }
  describe "methods" do
    describe "body_bottom" do
      it 'should return ad_form content' do
        expect(subject.body_bottom).to include('://www.smart4ads.com/smart4ads/api/PVTjs.php')
      end

      it 'should include id, seg and orderID' do
        expect(subject.body_bottom).to include("script id=\"12345678\"");
        expect(subject.body_bottom).to include("accountid=9876543");
        expect(subject.body_bottom).to include("totalcost=0.00");
        expect(subject.body_bottom).to include("orderid=PPEE44");
        expect(subject.body_bottom).to include("actioncode=XX0099");
      end

      it 'returns nothing if tracker not active' do
        subject.active = false
        expect(subject.body_bottom).to eq(nil)
      end
    end
  end
end
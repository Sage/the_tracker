require 'spec_helper'

describe TheTracker::Trackers::Kenshoo do
  subject { described_class.new(:token => 12345678, :type => 'en', :val => '2', :orderId => "ffffff", :promoCode => 'SomeThingReallyCool', :valueCurrency => 'EUR', trackEvent: '6969') }
  describe "methods" do
    describe "body_bottom" do
      it 'should return ad_form content' do
        expect(subject.body_top).to include('://6969.xg4ken.com/media/getpx.php')
      end

      it 'should include id, langage, format, color, label and value information' do
        expect(subject.body_top).to include("params[0]='id=12345678'");
        expect(subject.body_top).to include("params[1]='type=en'");
        expect(subject.body_top).to include("params[2]='val=2'");
        expect(subject.body_top).to include("params[3]='orderId=ffffff'");
        expect(subject.body_top).to include("params[4]='promoCode=SomeThingReallyCool'");
        expect(subject.body_top).to include("params[5]='valueCurrency=EUR'");
        expect(subject.body_top).to include("k_trackevent(params,'6969'");
      end

      it 'returns nothing if tracker not active' do
        subject.active = false
        expect(subject.body_top).to eq(nil)
      end
    end
  end
end

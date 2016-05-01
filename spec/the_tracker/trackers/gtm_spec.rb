require 'spec_helper'

describe TheTracker::Trackers::Gtm do
  subject { described_class.new(:gtmid => 'GTM-XXXXX') }
  describe "methods" do
    describe "body_top" do
      it 'should return gtm content' do
        expect(subject.body_top).to include('<iframe src="//www.googletagmanager.com/ns.html?id=')
      end

      it 'returns nothing if tracker not active' do
        subject.active = false
        expect(subject.body_top).to eq(nil)
      end
    end

    describe "add_data_layer" do
      before :each do
        subject.add_data_layer('client_id', 123)
      end

      it 'adds a new value to data layer info' do
        expect(subject.body_top).to include("'client_id': '123'")
      end
      it 'adds a new value to data layer info stack' do
        subject.add_data_layer('status', 'big_boss')
        expect(subject.body_top).to include("'client_id': '123','status': 'big_boss'")
      end
    end
  end
end

require 'spec_helper'

describe TheTracker::Trackers::Base do
  describe "methods" do
    describe "header" do
      it 'should return an empty array' do
         expect(subject.header).to eq([])
      end
    end

    describe "body_top" do
      it 'should return an empty array' do
         expect(subject.body_top).to eq([])
      end
    end

    describe "body_bottom" do
      it 'should return an empty array' do
         expect(subject.body_bottom).to eq([])
      end
    end

    describe "name" do
      it 'should raise a NotImplementedError' do
        expect { subject.name }.to raise_error(NotImplementedError)
      end
    end

    describe "active" do
      it 'should be active by default' do
        expect(subject.active).to be
      end

      it 'should be active by default' do
        subject.active = false
        expect(subject.active).to be_falsey
      end
    end
  end
end

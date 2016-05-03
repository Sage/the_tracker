require 'spec_helper'

describe TheTracker::Trackers::Uservoice do
  subject { described_class.new('abcd', {:forum_id => '111', :tab_label => 'Say Hi!'}) }
  describe "methods" do
    describe "header" do
      it 'should return uservoice script' do
        expect(subject.header).to include('widget.uservoice.com/abcd.js')
      end
    end

    describe "name" do
      it 'should return uservoice' do
        expect(subject.name).to eq(:uservoice)
      end
    end

    describe "body_bottom" do
      it 'should return uservoice variable' do
        expect(subject.body_bottom).to include('UserVoice = window.UserVoice')
      end

      it 'should include forum_id and tab_label information' do
        expect(subject.body_bottom).to include('"forum_id":"111"')
        expect(subject.body_bottom).to include('"tab_label":"Say Hi!"')
      end
    end
  end
end

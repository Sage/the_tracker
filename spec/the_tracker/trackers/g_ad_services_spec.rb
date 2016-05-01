require 'spec_helper'

describe TheTracker::Trackers::GAdServices do
  subject { described_class.new(:id => 12345678, :language => 'en', :format => '2', :color => "ffffff", :label => 'SomeThingReallyCool', :value => 0) }

  describe "methods" do
    describe "body_bottom" do
      it 'should return ad_form content' do
        expect(subject.body_bottom).to include('//www.googleadservices.com/pagead/conversion.js')
      end

      it 'should include id, langage, format, color, label and value information' do
        expect(subject.body_bottom).to include('var google_conversion_id = 12345678');
        expect(subject.body_bottom).to include("var google_conversion_language = \"en\"");
        expect(subject.body_bottom).to include("var google_conversion_format = \"2\"");
        expect(subject.body_bottom).to include("var google_conversion_color = \"ffffff\"");
        expect(subject.body_bottom).to include("var google_conversion_label = \"SomeThingReallyCool\"");
        expect(subject.body_bottom).to include('var google_conversion_value = 0');
      end

      it 'returns nothing if tracker not active' do
        subject.active = false
        expect(subject.body_bottom).to eq(nil)
      end
    end
  end

end

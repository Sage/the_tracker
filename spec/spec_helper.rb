require 'the_tracker'

class TheTracker::Tracker
  def self.reset
    %i[@one_time_trackers  @regular_trackers @trackers].each do |var|
      self.instance.instance_variable_set(var, {})
    end
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.before { TheTracker::Tracker.reset }
end

require 'pry'

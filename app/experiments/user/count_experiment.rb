require "scientist/experiment"

class User::CountExperiment
  include Scientist::Experiment

  attr_reader :name, :percent

  def initialize(name, percent)
    @name = name
    @percent = percent
  end

  def enabled?
    (rand(100) < percent).tap do |enabled|
      puts "enabled: #{enabled}"
    end
  end

  def publish(result)
    if result.matched?
      puts ":tada: matched"
    else
      puts "not matched"
      puts "want: #{result.control.cleaned_value}, got: #{result.candidates.first.cleaned_value}"
    end
  end
end

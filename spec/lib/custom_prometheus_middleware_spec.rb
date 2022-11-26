require "rails_helper"
require "custom_prometheus_middleware"

RSpec.describe CustomPrometheusMiddleware do
  subject { described_class.new(nil) }

  describe "#call" do
    it "calls the app" do
      expect(subject.call(nil)).to eq(nil)
    end
  end
end

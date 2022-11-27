require "rails_helper"
require "custom_prometheus_middleware"

RSpec.describe CustomPrometheusMiddleware do
  let(:params) { HashWithIndifferentAccess.new({ "action_controller.instance" => { controller: "posts", action: "index" } }) }
  let(:app) do
    Proc.new do |env|
      [200, params, ["OK"]]
    end
  end
  let(:logger) { CustomPrometheusMiddleware::DefaultLogger.new }

  subject { described_class.new(app, logger) }

  describe "#call" do
    it "calls the app" do
      expect(subject.call(params)).not_to eq(nil)
      expect(logger.counter["posts"]["index"]).to eq(1)
    end
  end
end

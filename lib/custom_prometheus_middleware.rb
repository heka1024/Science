# frozen_string_literal: true

class CustomPrometheusMiddleware
  def initialize(app, logger = DefaultLogger.new)
    @app = app
    @logger = logger
  end

  def call(env)
    result = @app.call(env)
    params = controller_env(env)
    @logger.increment(params[:controller], params[:action])
    result
  end

  private

  def controller_env(env)
    env["action_controller.instance"]
  end

  class DefaultLogger
    attr_reader :counter

    def initialize
      @counter = {}
    end

    def increment(controller, action)
      @counter[controller] ||= {}
      @counter[controller][action] ||= 0
      @counter[controller][action] += 1
    end
  end
end

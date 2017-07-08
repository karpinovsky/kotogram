require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Kotogram
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
  end
end

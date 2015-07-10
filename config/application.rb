require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ParrotApi
  class Application < Rails::Application
     config.active_job.queue_adapter = :sidekiq

     config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins 'localhost:4200', '127.0.0.1:4200', 'localhost:3000', '127.0.0.1:3000'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end
  end
end

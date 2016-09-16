require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
# require "active_record/railtie"
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Koala
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.time_zone = 'Beijing'

    config.exceptions_app = routes

    # 使用eager_load_paths 不用 auto_load_paths 是为了程序启动时一次性加载
    config.eager_load_paths << Rails.root.join('lib')

    config.generators do |g|
      g.orm :mongoid
    end
    config.api_only = true

    # ActiveModelSerializers.config.adapter = :json
    # config.middleware.insert_after Rack::Runtime, Rack::GridFS,
    #                                prefix: 'uploads', lookup: :path, database: "koala_#{Rails.env}"
  end
end

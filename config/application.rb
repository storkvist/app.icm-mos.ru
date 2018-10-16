require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Icm # rubocop:disable Style/ClassAndModuleChildren
  class Application < Rails::Application
    config.load_defaults 5.2

    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix = 'icm'

    config.generators.system_tests = nil

    config.i18n.default_locale = :ru
    config.time_zone = 'Moscow'
  end
end

Raven.configure do |config|
  config.dsn = 'https://2c6e7aef24fc465f9c7e5fa337c6a1f4:459eff10498646bc9f8b85ff4e8ba11c@sentry.io/1302267'
end

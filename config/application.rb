require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MessengerBot
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end

  Facebook::Messenger.configure do |config|
    config.access_token = 'EAAYWcNT6jMEBAPtsIQ9AZANx1ewo1ZAaebVG7cntScQTD4vYGuqvUHMu8g5uEL71YBqNfgX3eewiBG8tP1gIn7zbpI0xeS0vZAHqi45rCeJZCb2cIEZABwtCbsraZCNeaxWq46vRR46fz4SVD7vM8CVmuOWCLbZAL4GDfa3OSlDlQZDZD'
    config.app_secret = 'a0b03c2457c0173ccb4468d9f10869b6'
    config.verify_token = 'my_voice_is_my_password_verify_me'
  end
end

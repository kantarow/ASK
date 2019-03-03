require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ASK
  class Application < Rails::Application
    config.action_view.field_error_proc = proc { |html_tag, instance| html_tag }
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |generator|
      generator.test_framework :rspec,
                       fixtures: true,
               controller_specs: true,
                   helper_specs: false,
                  routing_specs: false
      generator.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  conf = LearningStudioAuthentication::Config::OAuthConfig.new({
    :application_id   => '4d2b474e-7b70-4b7e-aff5-7313567c2c38',
    :application_name => 'Lightpath',
    :client_string    => 'gbtestc',
    :consumer_key     => '04b11650-b3bb-41d6-91a6-c19936aaf4e5',
    :consumer_secret  =>  '8a72063be6d0409da86a5c239e39fd10'
})
oauth_factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(conf)
service = LearningStudioCore::BasicService.new(oauth_factory)
service.use_oauth2
end

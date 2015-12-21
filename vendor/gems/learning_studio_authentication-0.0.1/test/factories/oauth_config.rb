require 'json'
require 'learning_studio_authentication'

FactoryGirl.define do
  factory :oauth_config, :class => LearningStudioAuthentication::Config::OAuthConfig do
    application_id   "ac025775-11bf-4e78-a41c-a05285c25744"
    application_name "Sample-Library"
    consumer_key     "04b11650-b3bb-41d6-91a6-c19936aaf4e5"
    consumer_secret  "8a72063be6d0409da86a5c239e39fd10"
    client_string    "gbtestc"
  end
end

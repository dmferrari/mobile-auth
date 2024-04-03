# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('GOOGLE_OAUTH2_CLIENT_ID', nil), ENV.fetch('GOOGLE_OAUTH2_CLIENT_SECRET', nil)
end

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1091153040908856', 'fe531b3e321dad4ac837afb82bace7da'
end
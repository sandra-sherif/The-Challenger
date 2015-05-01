OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1578019285812802', '3cf2cff5f524bd30baf538641352ff06', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
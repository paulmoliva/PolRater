OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '160728694357785', 'e260c31b0ad0a2d91343cb4480ea8533', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

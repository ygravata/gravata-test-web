Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['744733412245-vjkg9en9jar6oo9f4gb9tknfnpdtllmi.apps.googleusercontent.com'], 
  ENV['CdQ5dn5pvvszbXyB6IEuG6gN']
end
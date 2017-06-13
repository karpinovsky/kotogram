Rails.application.configure do
  config.action_mailer.default_url_options = { :host => 'kotogram-project.com' }
  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.mailgun_settings = {
    api_key: 'key-48e15945ae08563021d2f6bae7c24c86',
    domain: 'kotogram-project.com',
  }
  config.action_cable.url = "/cable"
  config.action_cable.allowed_request_origins = ["https://kotogram-project.com"]
end

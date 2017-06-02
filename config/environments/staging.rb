Rails.application.configure do
  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
    api_key: '48826bd31af47a4d3ddf71f2af566b8c656c9921ed12c848e5dac0734640b49f594d411a783d3facc4a6ec559afb32356b56f9859d64901b5fe8551b70b1ba46',
    domain: 'mail.kotogram-project.com',
  }
end

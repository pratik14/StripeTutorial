config_path = Rails.root.join('config', 'stripe.yml')
config = YAML.load_file(config_path)[Rails.env]

Rails.configuration.stripe = {
  :publishable_key => config['publishable_key'],
  :secret_key => config['secret_key'],
  :premium_plan_id => 'PREMIUM',
  :basic_plan_id => 'BASIC'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

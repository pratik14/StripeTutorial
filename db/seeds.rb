Stripe::Plan.create(
  :amount => 2000,
  :interval => 'month',
  :name => 'Premium Plan',
  :currency => 'usd',
  :id => Rails.configuration.stripe[:premium_plan_id]
)

Stripe::Plan.create(
  :amount => 100,
  :interval => 'month',
  :name => 'Basic Plan',
  :currency => 'usd',
  :id => Rails.configuration.stripe[:basic_plan_id]
)

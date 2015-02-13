class PaymentController < ApplicationController
  before_action :require_user

  def subscribe
    begin
    if current_user.stripe_customer_id.present?
      customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    else
      customer = Stripe::Customer.create(email: current_user.username, card: params[:stripe_card_token])
      current_user.update_attribute(:stripe_customer_id, customer.id)
    end

    plan_id = Rails.configuration.stripe[params['plan'].to_sym]
    customer.subscriptions.create({:plan => plan_id})

    redirect_to root_path
    rescue Stripe::CardError
      render 'home/pricing'
    end
  end
end

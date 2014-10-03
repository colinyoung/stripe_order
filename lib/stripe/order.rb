require "stripe/order/version"

module Stripe::Order
  # Stripe Orders have:
  #
  # stripe_charge_id
  # - the individual charge that settled this order
  # customer
  # - the user object (in a devise setup, probably a User model
  #   object) which bought this order

  def customer
    self.respond_to?(:user) ? user : super
  end

  def stripe_charge
    Stripe::Charge.retrieve(stripe_charge_id)
  end
  alias :charge :stripe_charge

  def card
    stripe_charge.card
  end
end

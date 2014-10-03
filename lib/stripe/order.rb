require "stripe/order/version"

module Stripe::Order
  # Stripe Orders have:
  #
  # stripe_charge_id
  # - the individual charge that settled this order
  # stripe_card_id
  # - the card used
  # customer
  # - the user object (in a devise setup, probably a User model
  #   object) which bought this order
end

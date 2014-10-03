class CreateStripeCustomerFieldsFor<%= user_table_name.camelize.pluralize %> < ActiveRecord::Migration
  def change
    add_column :<%= user_table_name.downcase.pluralize %>, :stripe_customer_id, :string, unique: true, index: true
  end
end

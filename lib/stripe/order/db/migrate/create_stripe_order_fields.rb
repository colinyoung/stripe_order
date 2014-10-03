class CreateStripeOrderFieldsFor<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    add_column :<%= table_name %>, :stripe_charge_id, :string, unique: true, index: true
  end
end

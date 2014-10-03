require 'rails/generators'
require 'rails/generators/active_record'

# Thank you to FriendlyID for the generator template.
# https://github.com/norman/friendly_id/blob/master/lib/generators/friendly_id_generator.rb
# - @colinyoung

class StripeOrderGenerator < ActiveRecord::Generators::Base
  desc 'Generates the migrations needed for Stripe::Order models.'
  argument :name, type: :string, default: 'Order'
  argument :user_table_name, type: :string, default: 'User', required: false

  class_option :'skip-migration', :type => :boolean, :desc => "Don't generate a migration for the slugs table"
  # class_option :'skip-initializer', :type => :boolean, :desc => "Don't generate an initializer"

  source_root File.expand_path('../../stripe/order/db/migrate', __FILE__)

  # Copies the migration template to db/migrate.
  def copy_files
    return if options['skip-migration']
    migration_template 'create_stripe_order_fields.rb', "db/migrate/create_stripe_order_fields_for_#{table_name}.rb"
    migration_template 'create_stripe_customer_fields.rb', "db/migrate/create_stripe_customer_fields_for_#{user_table_name.downcase.pluralize}.rb"
  end

  # def create_initializer
  #   return if options['skip-initializer']
  #   copy_file 'initializer.rb', 'config/initializers/stripe_order.rb'
  # end
end

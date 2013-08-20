class AddPaymentDateToSpreeOrder < ActiveRecord::Migration
  def change
    add_column :spree_orders, :payment_date, :datetime
  end
end

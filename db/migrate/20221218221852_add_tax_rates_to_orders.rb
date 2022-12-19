class AddTaxRatesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :tax_rates, :jsonb
  end
end

class ChangeOrdersToPurchases < ActiveRecord::Migration[6.0]
  def change
    rename_table :orders, :purchases
    rename_column :shippings, :order, :remember_digest
  end
end

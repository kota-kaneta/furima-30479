class ChangeOrdersToPurchases < ActiveRecord::Migration[6.0]
  def change
    rename_table :orders, :purchases
  end
end

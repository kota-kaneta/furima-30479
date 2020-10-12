class RenameOrderTopurchase < ActiveRecord::Migration[6.0]
  def change
    rename_column :shippings, :order_id, :purchase_id
  end
end

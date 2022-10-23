class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_final_vehicle, :string
  end
end

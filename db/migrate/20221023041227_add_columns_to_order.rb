class AddColumnsToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_final_price, :integer
    add_column :orders, :order_final_deadline, :integer
    add_column :orders, :order_run_date, :date
    add_column :orders, :order_closing_date, :date
    add_column :orders, :delivery_final_status, :integer, default: 0
    add_column :orders, :justification, :string
  end
end

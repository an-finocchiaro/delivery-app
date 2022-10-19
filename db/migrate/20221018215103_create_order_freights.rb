class CreateOrderFreights < ActiveRecord::Migration[7.0]
  def change
    create_table :order_freights do |t|
      t.references :order, null: false, foreign_key: true
      t.references :transport_mode, null: true, foreign_key: true
      t.integer :final_price
      t.integer :final_deadline
      t.date :run_date

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :code
      t.string :pickup_address
      t.string :pickup_zipcode
      t.string :pickup_city
      t.string :pickup_state
      t.string :product_code
      t.integer :product_dimension
      t.integer :product_weight
      t.string :recipient_name
      t.string :recipient_phone
      t.string :deliver_address
      t.string :delivery_zipcode
      t.string :delivery_city
      t.string :delivery_state
      t.integer :delivery_distance

      t.timestamps
    end
  end
end

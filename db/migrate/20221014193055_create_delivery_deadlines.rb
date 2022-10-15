class CreateDeliveryDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_deadlines do |t|
      t.integer :min_delivery_distance
      t.integer :max_delivery_distance
      t.integer :deadline

      t.timestamps
    end
  end
end

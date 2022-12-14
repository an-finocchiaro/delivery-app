class CreateTransportModes < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_modes do |t|
      t.string :name
      t.integer :min_distance
      t.integer :max_distance
      t.integer :min_weight
      t.integer :max_weight
      t.integer :fixed_rate
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

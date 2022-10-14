class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :license
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :max_load
      t.integer :availability, default:0
      t.references :transport_mode, null: false, foreign_key: true

      t.timestamps
    end
  end
end

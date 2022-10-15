class CreateDistanceRates < ActiveRecord::Migration[7.0]
  def change
    create_table :distance_rates do |t|
      t.integer :min_distance_rate
      t.integer :max_distance_rate
      t.integer :price

      t.timestamps
    end
  end
end

class CreateWeightRates < ActiveRecord::Migration[7.0]
  def change
    create_table :weight_rates do |t|
      t.integer :min_weight_range
      t.integer :max_weight_range
      t.integer :price_kg

      t.timestamps
    end
  end
end

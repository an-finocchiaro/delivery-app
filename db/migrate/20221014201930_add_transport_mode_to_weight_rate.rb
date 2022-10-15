class AddTransportModeToWeightRate < ActiveRecord::Migration[7.0]
  def change
    add_reference :weight_rates, :transport_mode, null: false, foreign_key: true
  end
end

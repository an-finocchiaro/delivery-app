class AddTransportModeToDistanceRate < ActiveRecord::Migration[7.0]
  def change
    add_reference :distance_rates, :transport_mode, null: false, foreign_key: true
  end
end

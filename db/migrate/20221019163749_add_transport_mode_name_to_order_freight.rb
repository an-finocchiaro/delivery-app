class AddTransportModeNameToOrderFreight < ActiveRecord::Migration[7.0]
  def change
    add_column :order_freights, :transport_mode_name, :string
  end
end

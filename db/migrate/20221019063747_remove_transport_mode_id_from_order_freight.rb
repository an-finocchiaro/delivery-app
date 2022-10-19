class RemoveTransportModeIdFromOrderFreight < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_freights, :transport_mode, null: false, foreign_key: true
  end
end

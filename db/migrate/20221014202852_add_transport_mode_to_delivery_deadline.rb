class AddTransportModeToDeliveryDeadline < ActiveRecord::Migration[7.0]
  def change
    add_reference :delivery_deadlines, :transport_mode, null: false, foreign_key: true
  end
end

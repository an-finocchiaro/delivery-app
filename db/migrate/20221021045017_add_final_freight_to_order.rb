class AddFinalFreightToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :final_freight, :integer
  end
end

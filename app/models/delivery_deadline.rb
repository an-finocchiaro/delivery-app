class DeliveryDeadline < ApplicationRecord
  belongs_to :transport_mode

  validates :min_delivery_distance, :max_delivery_distance, :deadline, presence:true
end

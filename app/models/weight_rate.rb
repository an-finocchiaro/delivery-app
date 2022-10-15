class WeightRate < ApplicationRecord
  belongs_to :transport_mode

  validates :min_weight_range, :max_weight_range, :price_kg, presence: true
end

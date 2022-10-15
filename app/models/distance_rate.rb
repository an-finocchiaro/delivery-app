class DistanceRate < ApplicationRecord
  belongs_to :transport_mode

  validates :min_distance_rate, :max_distance_rate, :price, presence: true
end

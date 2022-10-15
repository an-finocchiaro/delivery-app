class TransportMode < ApplicationRecord
  has_many :vehicles
  has_many :weight_rates
  has_many :distance_rates
  has_many :delivery_deadlines

  validates :name, uniqueness: true

  validates :name, :min_distance, :max_distance, :min_weight, :max_weight, :fixed_rate, presence: true

  validates :min_distance, :max_distance, :max_weight, :fixed_rate, numericality: {greater_than: 0}

  enum status: {active: 0, inactive: 1}
end

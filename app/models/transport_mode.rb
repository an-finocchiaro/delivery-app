class TransportMode < ApplicationRecord
  has_many :vehicles
  has_many :weight_rates
  has_many :distance_rates
  has_many :delivery_deadlines
  has_many :order_freights

  validates :name, uniqueness: true

  validates :name, :min_distance, :max_distance, :min_weight, :max_weight, :fixed_rate, presence: true

  validates :min_distance, :max_distance, :max_weight, :fixed_rate, numericality: {greater_than: 0}

  enum status: {active: 0, inactive: 1}

 
  def price_calculator(tm, weight,distance)
    a = 0
    b = 0
    tm.weight_rates.each do |wr|
      if weight > wr.min_weight_range && weight <= wr.max_weight_range
        a = wr.price_kg * weight
      end
    end
    tm.distance_rates.each do |dr|
      if distance > dr.min_distance_rate && distance <= dr.max_distance_rate
        b = dr.price
      end
    end
    a + b + tm.fixed_rate
  end
  

  def calculate_final_deadline(tm, distance)
    d = 0
    tm.delivery_deadlines.each do |dd|
      if distance > dd.min_delivery_distance && distance <= dd.max_delivery_distance
        d = dd.deadline
      end
    end
    d
  end
end

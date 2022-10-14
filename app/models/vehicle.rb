class Vehicle < ApplicationRecord
  belongs_to :transport_mode

  enum availability: {available: 0, reserved: 1, maintenance: 2}

  validates :license, :brand, :model, :year, :max_load, presence: true
  validates :max_load, numericality: {greater_than: 0}
  validates :year, length: {is:4}
  validates :license, length: {is:7}
  validates :license, uniqueness: true
end


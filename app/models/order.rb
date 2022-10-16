class Order < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :running, :canceled]

  before_validation :generate_code, on: :create

  validates :pickup_address, :pickup_zipcode, :pickup_city, :pickup_state, :product_code, :product_dimension, :product_weight, :recipient_name, :recipient_phone, :deliver_address, :delivery_zipcode, :delivery_city, :delivery_state, :delivery_distance, presence: true

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
  
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_freights
  has_many :transport_modes
  has_many :vehicles, through: :transport_modes

  enum status: [:pending, :running, :processing, :closed]
  enum delivery_final_status: [:on_time, :out_of_time]

  before_validation :generate_code, on: :create

  validates :pickup_address, :pickup_zipcode, :pickup_city, :pickup_state, :product_code, :product_dimension, :product_weight, :recipient_name, :recipient_phone, :deliver_address, :delivery_zipcode, :delivery_city, :delivery_state, :delivery_distance, presence: true

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end

  def run_freights_calculator
    @order = Order.find(id)
    @transport_modes = TransportMode.all
    order_id = @order.id
    weight = @order.product_weight
    distance = @order.delivery_distance
    final_price = 0
    final_deadline = 0
    @transport_modes.each do |tm|
      if tm.active?
        if weight > tm.min_weight && weight <= tm.max_weight
          if distance > tm.min_distance && distance <= tm.max_distance
            final_price = tm.price_calculator(tm,weight,distance)
            final_deadline = tm.calculate_final_deadline(tm,distance)
            transport_mode_id = tm.id
            OrderFreight.create!(order_id: @order.id, transport_mode_id: transport_mode_id, final_price:final_price, final_deadline: final_deadline, run_date: Date.today)
          end
        end
      end
    end
  end

 
end

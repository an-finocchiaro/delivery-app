class Order < ApplicationRecord
  belongs_to :user
  has_many :transport_modes
  has_many :order_freights

  enum status: [:pending, :running, :processing, :closed]

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
        if weight > tm.min_weight && weight < tm.max_weight
          if distance > tm.min_distance && distance < tm.max_distance
            transport_mode_name = tm.name
            final_price = tm.price_calculator(tm,weight,distance)
            final_deadline = tm.calculate_final_deadline(tm,distance)
            OrderFreight.create!(order_id: @order.id, transport_mode_name: transport_mode_name,final_price:final_price, final_deadline: final_deadline, run_date: Date.today)
          end
        end
      end
    end
  end

  def set_vehicle(order_freight_id)
    @order_freight = OrderFreight.find(@order_freight.id)
    transport_mode_name = @order_freight.transport_mode_name
    @vehicles = Vehicle.where(name: transport_mode_name, availability: 0)
    @vehicle = @vehicles.first
    @vehicle.reserved!
    @vehicle.license
  end
end

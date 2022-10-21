class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def create
    order_params = params.require(:order).permit(:pickup_address, :pickup_zipcode, :pickup_city, :pickup_state, :product_code, :product_dimension, :product_weight, :recipient_name, :recipient_phone, :deliver_address, :delivery_zipcode, :delivery_city, :delivery_state, :delivery_distance)
    @order = Order.new(order_params)
    @order.user = current_user
    @orders = Order.all
    if @order.save
      redirect_to @order, notice: 'Pedido registrado com sucesso'
    else
      flash.now[:alert] = 'Não foi possível registrar o pedido'
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_freights = OrderFreight.all
    
  end

  def update
    @order = Order.find(params[:id])
    order_params = params.require(:order).permit(:pickup_address, :pickup_zipcode, :pickup_city, :pickup_state, :product_code, :product_dimension, :product_weight, :recipient_name, :recipient_phone, :deliver_address, :delivery_zipcode, :delivery_city, :delivery_state, :delivery_distance, :order_final_price, :order_final_deadline, :order_run_date, :order_closing_date,:delivery_final_status, :justification, :order_final_vehicle, :final_freight)
        
    @order.update!(order_params)
    redirect_to @order, notice: 'Alteração realizada com sucesso'
  end

  def run 
    @order = Order.find(params[:id])
    @order.running!
    @order.run_freights_calculator
    redirect_to @order
  end

  def proceed
    @order = Order.find(params[:id])
    order_freight_id = params.require(:order).permit(:order_freight_id)
    @order_freight = OrderFreight.find(order_freight_id)
    @order.order_final_price = @order_freight.final_price
    @order.order_final_deadline = @order_freight.final_deadline
    @order.order_run_date = Date.today
    @order.order_final_vehicle = set_vehicle(order_freight_id)
    @order.processing!
    redirect_to @order
  end
 
end
   
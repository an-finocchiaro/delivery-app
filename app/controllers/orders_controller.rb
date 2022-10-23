class OrdersController < ApplicationController

  def new
    @order = Order.new
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

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    @order_freights = OrderFreight.all
    @transport_modes = TransportMode.all
  end
  
  def run 
    @order = Order.find(params[:id])
    @order.running!
    @order.run_freights_calculator
    redirect_to edit_order_path
  end

  def update
    @order = Order.find(params[:id])
    if @order.running?
      order_freight_id = params["of_id"]
      @order_freight = OrderFreight.find(order_freight_id)
      set_and_update_variables()
      @order.processing!
      redirect_to @order, notice: 'Seleção realizada com sucesso'
      return
    elsif @order.processing?
      #@order.closed!
      order_params = params.require(:order).permit(:order_closing_date, :justification)
      @order.update!(order_params)
      redirect_to @order, notice: 'Alterações realizadas com sucesso'
    end
  end


  def set_and_update_variables
    order_final_price = @order_freight.final_price
    order_final_deadline = @order_freight.final_deadline
    order_run_date = Date.today
    order_final_vehicle = set_vehicle()
    order_params = {order_final_price: order_final_price, order_final_deadline: order_final_deadline, order_run_date: order_run_date, order_final_vehicle: order_final_vehicle}
    @order.update!(order_params)
  end

  def set_vehicle
    tm_id = @order_freight.transport_mode_id
    @transport_mode = TransportMode.find(tm_id)
    @vehicles = @transport_mode.vehicles
    @vehicles.each do |v|
      if v.available?
        v.reserved!
        order_final_vehicle = v.license
        return
      end
    end
  end
end  

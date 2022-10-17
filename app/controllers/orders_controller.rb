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
  end
end

        
        
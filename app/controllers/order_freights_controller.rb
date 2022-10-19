class OrderFreightsController < ApplicationController

  def new
    @order_freight = OrderFreight.new
  end

  def index
    @order_freights = OrderFreight.all
    @order_freight = OrderFreight.find(params[:id])
    render "order/show"
  end

  def create
    order_freight_params = params.require(:order_freight).permit(:order_id, :transport_mode_name,:final_price, :final_deadline, :run_date)
    @order_freight = OrderFreight.new(order_freight_params)

    if @order_freight.save
      redirect_to @order
    else
      flash.now[:alert] = 'Não foi possível registrar o pedido'
      redirect_to @order(@order.id)
    end
  end
end

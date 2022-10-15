class DeliveryDeadlinesController < ApplicationController

  def new
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    @delivery_deadline = DeliveryDeadline.new
  end

  def index
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    @delivery_deadlines = @transport_mode.delivery_deadlines
  end

  def create
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    delivery_deadline_params = params.require(:delivery_deadline).permit(:min_delivery_distance, :max_delivery_distance, :deadline, :transport_mode_id)
    @transport_mode.delivery_deadlines.create!(delivery_deadline_params)
    redirect_to @transport_mode , notice: 'Dados registrados com sucesso'
  end


end
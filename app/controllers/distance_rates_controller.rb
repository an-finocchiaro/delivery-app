class DistanceRatesController < ApplicationController

  def new
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    @distance_rate = DistanceRate.new
  end

  def create
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    distance_rate_params = params.require(:distance_rate).permit(:min_distance_rate, :max_distance_rate, :price, :transport_mode_id)
    @transport_mode.distance_rates.create!(distance_rate_params)
    redirect_to @transport_mode , notice: 'Dados registrados com sucesso'
  end

  def index
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    @distance_rates = @transport_mode.distance_rates
  end
end
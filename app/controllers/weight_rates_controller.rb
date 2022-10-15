class WeightRatesController < ApplicationController

  def new
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    @weight_rate = WeightRate.new
  end

  def create
    @transport_mode = TransportMode.find(params[:transport_mode_id])
    weight_rate_params = params.require(:weight_rate).permit(:min_weight_range, :max_weight_range, :price_kg, :transport_mode_id)
    @transport_mode.weight_rates.create!(weight_rate_params)
    redirect_to @transport_mode , notice: 'Dados registrados com sucesso'
  end

  def show
    @transport_mode = TransportMode.find(params[:id])
    @weight_rates = WeightRate.where("transport_mode_id LIKE ?", "%#{@transport_mode.id}%")
  end
end

class VehiclesController < ApplicationController
  before_action :authenticate_user!

  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
    @transport_modes = TransportMode.all
  end

  def create
    vehicle_params = params.require(:vehicle).permit(:license, :brand, :model, :year, :max_load, :availability, :transport_mode_id)
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to @vehicle, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :new
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    @transport_modes = TransportMode.all
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    vehicle_params = params.require(:vehicle).permit(:license, :brand, :model, :year, :max_load, :availability, :transport_mode_id)
    @vehicle.update(vehicle_params)
    redirect_to @vehicle, notice: t('.registered')
  end

  def search
    @license = params["query"]
    @vehicles = Vehicle.where("license LIKE ?", "%#{@license}%")
  end
end
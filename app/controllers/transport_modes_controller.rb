class TransportModesController < ApplicationController

  def index
    @transport_modes = TransportMode.all
  end
  
  def new
    @transport_mode = TransportMode.new
  end

  def create
    transport_mode_params = params.require(:transport_mode).permit(:name, :min_distance, :max_distance, :min_weight, :max_weight, :fixed_rate, :status)

    @transport_mode = TransportMode.new(transport_mode_params)
    
    if @transport_mode.save
      redirect_to @transport_mode, notice: 'Modalidade de Transporte cadastrada com sucesso'
    else
      flash.now[:alert] = 'Não foi possível cadastrar a Modalidade'
      render :new
    end
  end

  def show
    @transport_mode = TransportMode.find(params[:id])
  end

  def edit
    @transport_mode = TransportMode.find(params[:id])
  end

  def update
    @transport_mode = TransportMode.find(params[:id])
    transport_mode_params = params.require(:transport_mode).permit(:name, :min_distance, :max_distance, :min_weight, :max_weight, :fixed_rate, :status)
    @transport_mode.update(transport_mode_params)
    redirect_to @transport_mode, notice: 'Alteração registrada com sucesso'
  end
end

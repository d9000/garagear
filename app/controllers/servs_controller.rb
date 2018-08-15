class ServsController < ApplicationController
  before_filter :authenticate_profile!
  def new
    @veh = current_profile.vehs.find(params[:veh_id])
    @serv = @veh.servs.new
    @tiposervs = Tiposerv.all
  end
  def create
    @veh = current_profile.vehs.find(params[:veh_id])
    @serv = @veh.servs.build
    @serv.tiposerv_id = params[:ts_id]
    @serv.save
    redirect_to "/servs/#{@serv.id}/edit"
  end
  def show
    
  end
  def edit
    @serv = Serv.find(params[:id])
    #@serv.tiposervicio_id = params[:ts_id]
    #@serv.save
    #redirect_to root_path
  end
  def update
    @serv = Serv.find(params[:id])
    @serv.update_attributes(serv_params)
    if @serv.save
      flash[:success] = "Nuevo servicio regisrtado!"
    else
      flash[:error] = "Error"
    end
    redirect_to root_path
  end
  private

    def serv_params
      params.require(:serv).permit(:descripcion, :kilometros, :costo)
    end
  
end

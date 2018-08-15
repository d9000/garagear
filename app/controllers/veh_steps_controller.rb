class VehStepsController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_profile!
  steps :update_marca, :update_modelo, :update_aniov, :update_version
  
  def show
    #ok
    #@veh = Veh.find(params[:veh_id])
    @veh = current_profile.vehs.find(params[:veh_id])
    #@marcas = 
    render_wizard
  end
  
  def update
    #@veh = Veh.find(params[:veh_id])
    @veh = current_profile.vehs.find(params[:veh_id])
    @veh.update_attributes(veh_params)
    #flash[:success] = "Vehículo actualizado!"
    #redirect_to root_path
    render_wizard @veh
    #else
    #render :edit
  end
  
  private
  def finish_wizard_path
    root_path
  end
  def veh_params
      params.require(:veh).permit(:dominio, :marca_id, :modelo_id, :aniov_id, :version_id, :avatar)
  end
end

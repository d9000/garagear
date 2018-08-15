class VehsController < ApplicationController
  #ok
  #include Wicked::Wizard
  #ok
  #skip_before_filter :setup_wizard, :only => [:index, :edit, :edit_marca, :edit_avatar] 
  
  #steps :update_marca, :update_modelo
  
  #ok
  before_filter :authenticate_user!
  #TODO funciona pero no es necesario restringiar en esta instancia
  #load_and_authorize_resource :only => [:new, :edit, :destroy, :edit_avatar] 

  
  def new
    if current_profile.has_any_role? :service, {:name => :admin}
      #veh unclaimend, no tiene usuario asignado.
      @veh = Veh.new
    else
      @veh = current_profile.vehs.new
    end
  end
  
  def show
    if params[:dominio]
      @veh = Veh.find_by_dominio!(params[:dominio].to_s)
    else
      #ok
      #@veh = Veh.find(params[:veh_id])
      #TODO chequear nivel de privacidad
      @veh = Veh.find(params[:veh_id])
       #render_wizard
    end
  end
  
  def create
    #ok
    @veh = current_profile.vehs.build(veh_params)
    #TODO agregar validador de dominio, que no sea duplicado.
    
    if @veh.save
      #flash[:success] = "Nuevo vehículo creado."
      #redirect_to root_url
      #redirect_to veh_steps_path
      #redirect_to veh_steps_path(:id => 'update_marca', :veh_id => @veh.id)
      redirect_to "/vehs/#{@veh.id}/veh_steps/update_marca"
    else
      flash[:error] = "Ocurrio un error al intentar registrar su vehículo."
      redirect_to root_url
    end
  end
  
  def index
    @marcas = Marca.all
  end
  
  def edit
    #@veh = Veh.find(params[:id])
    @veh = current_profile.vehs.find(params[:id])
  end
  
  def edit_avatar
    #@veh = Veh.find(params[:id])
    @veh = current_profile.vehs.find(params[:id])
  end
  
  def edit_marca
    #@veh = Veh.find(params[:id])
    @veh = current_profile.vehs.find(params[:id])
    @marcas = Marca.all
  end
  
  def update
    #@veh = Veh.find(params[:id])
    @veh = current_profile.vehs.find(params[:id])
    @veh.update_attributes(veh_params)
    flash[:success] = "Vehículo actualizado!"
    redirect_to root_path
    #render_wizard @veh
    #else
    #attr_reader :attr_namesender :edit
    
  end

  
  private

    def veh_params
      params.require(:veh).permit(:dominio, :avatar)
    end

end

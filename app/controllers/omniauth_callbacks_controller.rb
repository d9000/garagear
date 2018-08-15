class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate_profile!
  
  def all
    p request.env["omniauth.auth"]
    profile = Profile.from_omniauth(request.env["omniauth.auth"], current_profile)
    if profile
      #TODO agregar mensaje aleatorio.
      #TODO check si lname o fname no son nil
      flash[:notice] = "¡Bienvenido #{profile.fname} #{profile.lname}!"
      #TODO chequear el rol, si es un service enviar al serivce backend
      sign_in_and_redirect(profile)
      
    else
      #TODO manejar el error
      session["devise.profile_attributes"] = profile.attributes
      redirect_to new_profile_registration_url
    end
  end

  def failure
      #handle you logic here..
      #and delegate to super.
      super
  end


  alias_method :facebook, :all
  alias_method :passthru, :all
  alias_method :google_oauth2, :all
end
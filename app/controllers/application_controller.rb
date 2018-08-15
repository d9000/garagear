class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_profile!
  alias_method :current_user, :current_profile
  
  layout :layout

  def current_ability
    @current_ability ||= Ability.new(current_profile)
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  private
  
  def layout
    # only turn it off for login pages:
    #is_a?(Devise::SessionsController) ? false : "application"
    # or turn layout off for every devise controller:
    #!devise_controller? && "application"
    #if devise_controller?
    #  "devise"
    if controller_name == 'registrations' && action_name == 'new'
      'devise'
    elsif controller_name == 'registrations' && action_name == 'create'
      'devise'
    elsif controller_name == 'sessions' && action_name == 'new'
      'devise'
    elsif controller_name == 'passwords' && action_name == 'new'
      'devise'
    elsif controller_name == 'frontend'
      'frontend'
    else
      "application"
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
  



      u.permit(:fname, :lname, :username, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:fname, :lname, :username, :email, :password, :password_confirmation)
    end
  end
  
end

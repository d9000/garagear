class RegistrationsController < Devise::RegistrationsController
  
  def update
    @profile = Profile.find(current_profile.id)

    successfully_updated = if needs_password?(@profile, params)
      #@profile.update_with_password(params[:profile])
      @profile.update_with_password(devise_parameter_sanitizer.for(:account_update))
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:profile].delete(:current_password)
      #@profile.update_without_password(params[:profile])
      @profile.update_without_password(devise_parameter_sanitizer.for(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @profile, :bypass => true
      redirect_to after_update_path_for(@profile)
    else
      render "edit"
    end
  end

  private
  def permit_params
      params.require(:profile).permit(:fname, :lname)
  end
  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(profile, params)
    profile.email != params[:profile][:email] ||
      params[:profile][:password].present?
  end
end
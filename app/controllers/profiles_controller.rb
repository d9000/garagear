class ProfilesController < ApplicationController
  before_filter :set_profile, only: [:show, :edit, :update]
  before_filter :validate_authorization_for_profile, only: [:edit, :update]
  before_filter :skip_password_attribute, only: [:update]

  # GET /users/1
  def show
  end

  # GET /users/1/edit
  def edit
  end


  # PATCH/PUT /users/1
  def update
    if params[:profile][:password].blank? && params[:profile][:password_confirmation].blank?
      params[:profile].delete(:password)
      params[:profile].delete(:password_confirmation)
    end
    if @profile.update_attributes(permit_params)
      redirect_to @profile, notice: 'El perfil de usuario se actaulizó.'
    else
      render action: 'edit'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def validate_authorization_for_profile
       redirect_to root_path unless @profile == current_profile
    end
    def permit_params
      params.require(:profile).permit(:fname, :lname)
    end
    def skip_password_attribute
      if params[:password].blank? && params[:password_validation].blank?
        params.except!(:password, :password_validation)
    end
  end
  end
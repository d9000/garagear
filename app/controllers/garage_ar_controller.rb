class GarageArController < ApplicationController
  before_filter :authenticate_profile!, :except => [:index2, 404]
  
  def index
    @vehs = current_profile.vehs.all
  end
  
  def index2
    #public
  end
end

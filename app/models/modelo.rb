class Modelo < ActiveRecord::Base
  belongs_to :marca
  has_many :aniode_fabs
end

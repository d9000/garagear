class Aniov < ActiveRecord::Base
  has_many :versions
  belongs_to :modelo
end

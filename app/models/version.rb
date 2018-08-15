class Version < ActiveRecord::Base
  belongs_to :aniov
  has_many :vehs
end

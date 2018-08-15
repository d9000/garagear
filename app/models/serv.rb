class Serv < ActiveRecord::Base
  resourcify
  belongs_to :veh
  belongs_to :tiposerv
end

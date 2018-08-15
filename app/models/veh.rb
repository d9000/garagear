class Veh < ActiveRecord::Base
  resourcify
  belongs_to :profile
  #validates :profile_id, presence: true
  validates :dominio, presence: true, length: { maximum: 6 }#, format: { with: /^[a-z|A-Z]{3}\d{3}$/ } 
  
  has_many :servs
  belongs_to :version
  #has_many :aniov, :through => :version
  has_attached_file :avatar, {
    :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
    :url => "/system/:attachment/:id/:style.:extension",
    :styles => {
      :thumb => ["50x50#", :png],
      :medium => ["140x140#", :png],
      :large => ["300x300>", :png]
    },
    :convert_options => {
      :thumb => "-gravity Center -crop 50x50+0+0",
      :medium => "-gravity Center -crop 140x140+0+0",
    }
  }
  #validates_attachment_content_type :content_type => %w(image/jpeg image/jpg image/png)
  validates_attachment :avatar,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png)$/ }
  #PRIVSTATUSES = [PRIVSTATUS_PRIVATE = 'private', PRIVSTATUS_MEMBERS = 'members', PRIVSTATUS_PUBLIC = 'public']#?
  #PRIVSTATUS = { private: 0, members: 1, public: 2, service: 3 }
 
  #def privstatus
  #  PRIVSTATUS.key(read_attribute(:privstatus))
  #end
 
  #def privstatus=(s)
  #  write_attribute(:privstatus, PRIVSTATUS[s])
  #end
  
  #UPDATEABLE = []
  #validates :privstatus, inclusion: {in: PRIVSTATUSES}
  
  #using enumify
  enum :privstatus, [:private, :public, :allowservice, :allowmembers], :allow_nil => true
  
end

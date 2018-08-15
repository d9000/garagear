class Profile < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  after_create :assign_default_role
       
  has_many :authentications
  has_many :vehs, dependent: :destroy
  #validates_presence_of :password_confirmation, :on => :create
  
  def assign_default_role
    add_role(:owner)
  end
  
  def self.new_with_session(params,session)
    if session["devise.profile_attributes"]
      new(session["devise.profile_attributes"],without_protection: true) do |profile|
        profile.attributes = params
        profile.valid?
      end
    else
      super
    end
  end
  #no se usa
  def self.from_omniauth2(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |profile|
      profile.provider = auth.provider
      profile.uid = auth.uid
      profile.email = auth.info.email
      profile.name = auth.info.name
      profile.save!
    end
  end
  
  def self.from_omniauth(auth, current_profile)
    authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token).first_or_initialize
    if authentication.profile.blank?
      profile = current_profile.nil? ? Profile.where('email = ?', auth["info"]["email"]).first : current_profile
      if profile.blank?
        profile = Profile.new
      end
       profile.password = Devise.friendly_token[0,10]
       #profile.name = auth.info.name
       profile.email = auth.info.email
       #profile.user_id = auth.id
       profile.fname = auth.info.first_name
       profile.lname = auth.info.last_name
       profile.image = auth.info.image
       
       #auth.provider == "twitter" ?  user.save(:validate => false) :  
      profile.save
      #profile.add_role = :owner
     #end
     authentication.username = auth.info.nickname
     authentication.profile_id = profile.id
     authentication.save
   end
   profile
 end

end
        


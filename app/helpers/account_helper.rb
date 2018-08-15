module AccountHelper
  def show_provider
    if current_profile.authentications.last
      return current_profile.authentications.last.provider.to_s.titleize
    else
      return 'cuenta local'
    end
  end
  def screen_name_for_current_profile
    if current_profile.lname && current_profile.fname
      return current_profile.fname + ' ' + current_profile.lname
    else
      return 'No especificado'
    end    
  end
  
end

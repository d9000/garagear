module ApplicationHelper
  def flash_class(level)
    case level
        when :notice then "alert alert-info alert-dismissable"
        when :success then "alert alert-success alert-dismissable"
        when :error then "alert alert-error alert-dismissable"
        when :alert then "alert alert-error alert-dismissable"
        else "alert alert-info alert-dismissable"

    end
  end
  
  def avatar_for(profile)
    #gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    #<img class="media-object" src="http://placehold.it/50x50" >
  
    if profile.image.blank?
      image_tag('http://placehold.it/50x50', alt: profile.email, class: "gravatar")
    else  
      image_tag(profile.image, alt: profile.email, class: "gravatar")
    end
  end
end

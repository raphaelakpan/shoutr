module UserHelper
  def avatar(user)
    emaiL_digest = Digest::MD5.hexdigest user.email
    gravatar_url = "//www.gravatar.com/avatar/#{emaiL_digest}"
    image_tag gravatar_url
  end

  def follow_button(user)
    return if current_user.id == user.id

    if current_user.following? user
      button_to "Unfollow", unfollow_user_path(user), method: :delete
    else
      button_to "Follow", follow_user_path(user)
    end
  end
end

module ShoutHelper
  def avatar(user)
    emaiL_digest = Digest::MD5.hexdigest user.email
    gravatar_url = "//www.gravatar.com/avatar/#{emaiL_digest}"
    image_tag gravatar_url
  end
end

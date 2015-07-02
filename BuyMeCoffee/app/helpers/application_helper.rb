module ApplicationHelper
  def gravatar_url(email, size)
      gravatar = Digest::MD5::hexdigest(email).downcase
      url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end


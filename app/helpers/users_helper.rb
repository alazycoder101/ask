module UsersHelper

  def avatar_url_for(user)
    return '/images/avatar/small.jpg' unless user.avatar.attached?
  end
end

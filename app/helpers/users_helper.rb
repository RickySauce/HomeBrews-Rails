module UsersHelper

  def title(user)
    "#{user.username}'s Profile"
  end

  def ownership(user)
    if user == current_user
      "Your"
    else
      "Their"
    end
  end


end

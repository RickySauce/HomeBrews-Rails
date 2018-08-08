module ApplicationHelper

  def check_user(user)
    current_user == user
  end

end

module SubStylesHelper

  def substyle_title(user, substyle)
    if user
      "#{user.username}'s #{substyle.name}s"
    else
      "#{substyle.name}s"
    end
  end

end

module SubStylesHelper

  def substyle_title(user, substyle)
    if user
      "#{user.username}'s #{substyle.name}s"
    else
      "#{substyle.name}s"
    end
  end

  def substyle_recipes (user, sub_style)
    if user
      Recipe.get_recipes(user, sub_style)
    else
      sub_style.recipes
    end
  end

end

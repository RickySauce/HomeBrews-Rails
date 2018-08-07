module RecipesHelper

  def information(recipe)
    [
     "Boil Size: #{pluralize(recipe.boil_size, "Gallon")}",
     "Batch Size: #{pluralize(recipe.batch_size, "Gallon")}",
     "Original Gravity: #{recipe.og}",
     "Final Gravity: #{recipe.fg}",
     "ABV: #{recipe.abv}%",
     "IBU: #{recipe.ibu}",
   ]
  end

end

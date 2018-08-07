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

  def ingredients(recipe)
    recipe.recipe_ingredients.collect do |r_i|
      "#{r_i.ingredient.type_name}: #{r_i.ingredient.name} #{pluralize(r_i.quantity, "#{r_i.measurement.capitalize}") unless r_i.ingredient.type_name == "Yeast"}"
    end
  end

end

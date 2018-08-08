class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, :measurement, presence: true,
    unless: Proc.new { |a| Ingredient.find(a.ingredient_id).type_name == "Yeast" }
  validates :quantity, :numericality => {:greater_than_or_equal_to => 0},
    unless: Proc.new { |a| Ingredient.find(a.ingredient_id).type_name == "Yeast" }
end

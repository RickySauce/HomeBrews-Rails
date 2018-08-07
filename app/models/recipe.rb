class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :sub_style
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
  validates :name, presence: true, uniqueness: true
  validates :boil_size, :batch_size, :og, :fg, :abv, :ibu, :user_id, :description, presence: true

  def get_recipe_ingredients(ingredients_hash)
    ingredients_hash.values.each do |ingredient_attribute|
      recipe_ingredient = RecipeIngredient.new(ingredient_attribute)
      recipe_ingredient.recipe_id = self.id
      recipe_ingredient.save
      self.recipe_ingredients << recipe_ingredient if recipe_ingredient.save
    end
  end

end

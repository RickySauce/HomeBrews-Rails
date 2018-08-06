class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :sub_style
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
  validates :name, presence: true, uniqueness: true
  validates :sub_style_id, :boil_size, :batch_size, :og, :fg, :abv, :ibu, :user_id, presence: true
  # after_initialize :give_water
  # accepts_nested_attributes_for :recipe_ingredients

  def give_water
    self.ingredients << Ingredient.get_water
  end
end

class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, :measurement, presence: true
  validates :quantity, :numericality => {:greater_than_or_equal_to => 0}
end

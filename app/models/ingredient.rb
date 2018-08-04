class Ingredient < ApplicationRecord
  has_many :recipe_ingredients

  def self.get_malts
    Ingredient.where(type_name: "Malt")
  end

  def self.get_hops
    Ingredient.where(type_name: "Hops")
  end

  def self.get_yeast
    Ingredient.where(type_name: "Yeast")
  end
  
end

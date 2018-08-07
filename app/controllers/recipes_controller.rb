class RecipesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.get_recipe_ingredients(params["recipe"]["recipe_ingredients_attributes"])
    if @recipe.save
      binding.pry
      redirect_to user_recipe_path(current_user, @recipe)
    else
      render :new
    end
  end

  def show
    binding.pry
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def recipe_params
      params.require(:recipe).permit(
        :name,
        :sub_style_id,
        :batch_size,
        :boil_size,
        :og,
        :fg,
        :abv,
        :ibu,
        :user_id,
        :description,
        :recipe_ingredients_attributes,
      )
    end

end

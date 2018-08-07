class RecipesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipe.get_recipe_ingredients(params["recipe"]["recipe_ingredients_attributes"])
      if @recipe.recipe_ingredients.count == 4
        redirect_to user_recipe_path(current_user, @recipe)
      else
        @recipe.destroy
        flash[:message] = "Must fill out all Ingredient fields!"
        @recipe = Recipe.new(recipe_params)
        render :new
      end
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
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

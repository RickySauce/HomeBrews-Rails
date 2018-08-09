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
        @recipe.recipe_ingredients.clear
        flash[:message] = "Must fill out all Ingredient fields!"
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
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if !current_user == @recipe.user
      redirect_to recipe_path(@recipe)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_ingredients.clear
    @recipe.get_recipe_ingredients(params["recipe"]["recipe_ingredients_attributes"])
    if @recipe.update(recipe_params) && @recipe.recipe_ingredients.count == 4
       redirect_to recipe_path(@recipe)
    else
      flash[:message] = "Must fill out all Ingredient fields!"
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      flash[:message] = "Recipe Successfully deleted"
    end
    redirect_to '/'
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

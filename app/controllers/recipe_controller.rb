class RecipeController < ApplicationController
  def public_index
    @recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @recipe.destroy
  end
end

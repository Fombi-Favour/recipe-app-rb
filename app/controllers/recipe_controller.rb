class RecipeController < ApplicationController
  def public_index
    @recipes = Recipe.includes(:recipe_foods, recipe_foods: :food).where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def modal
    @recipe = Recipe.find(params[:id])
    @inventories = Inventory.all
  end

  def shopping_list
    @recipe = Recipe.find(params[:id])
    @inventory = Inventory.find(params[:inventory_id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @recipe.destroy
  end
end

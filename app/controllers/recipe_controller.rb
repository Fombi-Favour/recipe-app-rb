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
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @inventory = Inventory.includes(inventory_foods: :food).find(params[:inventory_id])

    @shop_list = []
    @recipe.recipe_foods.each do |rf| 
      i_food =  @inventory.inventory_foods.find_by(food: rf.food)

      if i_food.nil?
        quantity = rf.quantity
        shop_price = quantity *  rf.food.price
      else
        if i_food.quantity < rf.quantity
          quantity = rf.quantity - i_food.quantity
          shop_price = quantity *  rf.food.price
        else
          quantity = 0
        end
      end

      if quantity > 0 
        @shop_list << {
          name: rf.food.name,
          quantity:,
          measurement_unit: rf.food.measurement_unit,
          shop_price:
        }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @recipe.destroy
  end
end

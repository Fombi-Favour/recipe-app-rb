class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    @recipes = Recipe.find(params[:id])
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipes = Recipe.new(recipe_params)
    if @recipes.save
      redirect_to recipes_path, notice: 'Recipe was successfully created'
    else
      render :new, notice: 'Recipe was not created'
    end
  end

  private

  def recipe_params
    params.require(:recipes).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end

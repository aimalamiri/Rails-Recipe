class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user: current_user)
  end

  def show
    @recipe = Recipe.find params[:id]
  end
end

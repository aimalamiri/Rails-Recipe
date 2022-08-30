class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user: current_user)
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy!
    redirect_to recipes_path, flash: { success: "#{@recipe.name} has been deleted successfully!" }
  end
end

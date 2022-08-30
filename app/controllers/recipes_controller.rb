class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user: current_user)
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path,
                  flash: { success: "#{@recipe.name} has been successfully created!" }
    else
      redirect_to new_recipe_path, flash: { error: @recipe.errors.full_messages }
    end
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy!
    redirect_to recipes_path, flash: { success: "#{@recipe.name} has been deleted successfully!" }
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end

class RecipeFoodsController < ApplicationController
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]),
                  flash: { success: "#{@recipe_food.food.name} has been attached successfully!" }
    else
      redirect_to recipe_path(params[:recipe_id]),
                  flash: { error: "Failed to attach #{@recipe_food.food.name}!" }
    end
  end

  private

  def recipe_food_params
    params.permit(:food_id, :recipe_id, :quantity)
  end
end

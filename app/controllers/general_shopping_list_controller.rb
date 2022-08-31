class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @items = RecipeFood.includes(:food).where(recipe_id: @recipes.map(&:id))
    @foods = Food.where(id: @items.map(&:food_id))
    @price = total_price(@items)
  end

  private

  def total_price(items)
    price = 0
    items.each do |recipe_food|
      price += Food.find(recipe_food.food_id).price * recipe_food.quantity
    end
    price
  end
end

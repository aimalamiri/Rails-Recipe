class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @owned_food = current_user.foods.all
  end

  def new
    @food = Food.new
  end

  def add_food
    @new_food = current_user.foods.new(food_params)

    if @new_food.save
      redirect_to foods_path,
                  flash: { success: "#{@new_food.name} has been added , with a price of #{@new_food.price}$ per 1 #{@new_food.measurement_unit}" }
    else
      redirect_to foods_new_path, flash: { error: @new_food.errors.full_messages }
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

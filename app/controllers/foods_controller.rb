class FoodsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_food_not_found
  before_action :authenticate_user!

  # Get all foods for a logged in user
  def index
    @owned_food = current_user.foods.all
  end

  # Adding a new food form
  def new
    @food = Food.new
  end

  # Delete Food by ID
  def destroy
    @delete_food = current_user.foods.find(params['id'])
    if @delete_food.destroy
      redirect_to foods_path,
                  flash: { success: 'food has been deleted' }
    else
      redirect_to foods_path,
                  flash: { error: 'food not found' }
    end
  end

  # submit food form
  def create
    @new_food = current_user.foods.new(food_params)

    if @new_food.save
      redirect_to foods_path,
                  flash: { success: "#{@new_food.name} has been added ,
                   with a price of #{@new_food.price}$ per 1 #{@new_food.measurement_unit}" }
    else
      redirect_to new_foods, flash: { error: @new_food.errors.full_messages }
    end
  end

  # Error when deleting a not found food id
  def render_food_not_found
    redirect_to foods_path,
                flash: { error: 'food not found' }
  end

  # Sanitize food params before saving in tha database
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end

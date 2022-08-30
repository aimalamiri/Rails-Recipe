class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 1 }
  validates :cooking_time, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 1 }
  validates :description, presence: true, allow_blank: true
  validates :public, inclusion: { in: [true, false] }

  def getfoods(id)
    food_list = []
    recipe_foods = RecipeFood.where(recipe_id: id)

    recipe_foods.each do |foods|
      Food.where(id: foods.food_id).each do |food|
        food_list.push(food)
      end
    end
    food_list
  end

  def total_price(food_list)
    total = 0
    food_list.each do |food|
      RecipeFood.where(food_id: food.id).each do |recipe_food|
        @sigle_food_price = food.price * recipe_food.quantity
      end
      total += @sigle_food_price
    end
    total
  end
end

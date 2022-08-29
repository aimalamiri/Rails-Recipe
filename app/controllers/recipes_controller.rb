class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(user: current_user)
    p @recipes
  end
end

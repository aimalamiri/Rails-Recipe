class HomeController < ApplicationController
  def index
    @recent_recipe = Recipe.where(public: true).order(created_at: :desc).limit(3)
  end
end

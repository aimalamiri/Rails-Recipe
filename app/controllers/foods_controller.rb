class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
  end
  def new
  end
end

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :all do
    @user = User.create(name: "User 1", email: "user1@test.com", password: 'password').encrypted_password
    @recipe = Recipe.new(name: 'Recipe', preparation_time: 20, cooking_time: 15, description: 'text', public: true, user_id: 1 )
    @recipe.save!
  end

  it 'name should be present' do
    @recipe.name = ''
    expect(@recipe).to_not be_valid
  end
end

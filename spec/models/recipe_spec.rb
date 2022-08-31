require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: "User 1", email: "user1@test.com", password: 'password').encrypted_password
    @recipe = Recipe.new(name: 'Recipe', preparation_time: 20, cooking_time: 15, description: 'text', public: true, user_id: 1 )
    @recipe.save!
  end

  it 'name should be present' do
    @recipe.name = ''
    expect(@recipe).to_not be_valid
  end

  it 'name should not be over 255 characters' do
    @recipe.name = 'a'*256
    expect(@recipe).to_not be_valid
  end

  it 'preparation time should be an integer value' do
    @recipe.preparation_time = 'twenty'
    expect(@recipe).to_not be_valid
  end

  it 'preparation time should be greater then or equal to 1' do
    @recipe.preparation_time = -2
    expect(@recipe).to_not be_valid
  end
end

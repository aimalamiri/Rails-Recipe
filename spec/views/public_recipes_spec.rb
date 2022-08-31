require 'rails_helper'

RSpec.describe 'Public Recipes Page', type: :system do
  before :all do
    User.create(name: 'User 1', email: 'user1@test.com', password: 'password').encrypted_password
    @user = User.last

    Recipe.create(
      name: "Recipe",
      preparation_time: rand(10..60),
      cooking_time: rand(10..60),
      description: "Lorem ipsum dolor sit amit",
      public: {0 => true, 1 => false}[rand(2)],
      user_id: @user.id
    )
  end

  it 'visits public_recipes index page' do
    visit public_recipes_path
    expect(page).to have_content('Here you can find all of the public recipes')
  end
end

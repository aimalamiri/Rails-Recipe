require 'rails_helper'

RSpec.describe 'Recipe Page', type: :system do
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

  before :each do
    sign_in @user
  end

  it 'visits the recipes index page' do
    visit recipes_path
    expect(page).to have_content('List of your recipes')
  end
end
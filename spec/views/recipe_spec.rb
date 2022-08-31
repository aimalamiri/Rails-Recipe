require 'rails_helper'

RSpec.describe 'Recipe Page', type: :system do
  before :all do
    User.create(name: 'User 1', email: 'user1@test.com', password: 'password').encrypted_password
    @user = User.last

    Recipe.create(
      name: 'Recipe',
      preparation_time: rand(10..60),
      cooking_time: rand(10..60),
      description: 'Lorem ipsum dolor sit amit',
      public: { 0 => true, 1 => false }[rand(2)],
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

  it 'visits the recipes new page' do
    visit recipes_path
    find('#add-recipe').click
    expect(page).to have_content('Add new recipe')
  end

  it 'visits the recipes new page' do
    visit new_recipe_path
    find('#name').set 'Juice'
    find('#preparation_time').set 25
    find('#cooking_time').set 20
    find('#description').set 'Some text here'
    find('#public').set true
    find('#submit').click
    expect(page).to have_content('Juice has been successfully created!')
  end

  it 'deletes a recipe when delete button is clicked' do
    visit recipes_path
    first('button.delete').click
    expect(page).to have_content('has been deleted successfully!')
  end

  it 'visits the recipes show page' do
    visit recipes_path
    first('a.show').click
    expect(page).to have_content('Step to go')
  end
end

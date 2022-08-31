require 'rails_helper'

RSpec.describe 'Foods Page', type: :system do
  before :all do
    User.create(name: 'User 1', email: 'user1@test.com', password: 'password').encrypted_password
    @user = User.last

    @food = Food.create(name: 'FOOD1', price: 3, measurement_unit: 'kilos', quantity: 3, user_id: @user.id)
  end

  before :each do
    sign_in @user
  end

  it 'visits the foods index page' do
    visit foods_path
    expect(page).to have_content(@food.name)
  end

  it 'visits the foods index page' do
    visit foods_path
    find('#add-food').click
    expect(page).to have_content('Add New Food')
  end
end

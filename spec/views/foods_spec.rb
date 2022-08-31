require 'rails_helper'

# require_relative '../helpers/auth_helper'
# include AuthHelper

RSpec.describe 'Foods Page', type: :system do
  before :all do
    @user = User.first
    sign_in @user

    @food = Food.create(name:'FOOD1',price:3,measurement_unit:'kilos',quantity:3,user_id: @user.id)
  end

  it 'visits the foods index page' do
    visit foods_path
    expect(page).to have_content(@food.name)
  end
end

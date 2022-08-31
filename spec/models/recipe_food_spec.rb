require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject { RecipeFood.create(quantity: 3, food_id: 1, recipe_id: 1) }
  before { subject.save }

  it 'recipe_id should be present' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'recipe_id  should be integer' do
    subject.recipe_id = 'hello'
    expect(subject).to_not be_valid
  end

  it 'food_id should be present' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'food_id  should be integer' do
    subject.food_id = 'test'
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity  should be integer' do
    subject.quantity = 'test'
    expect(subject).to_not be_valid
  end

  it 'quantity should be >= 0' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end
end

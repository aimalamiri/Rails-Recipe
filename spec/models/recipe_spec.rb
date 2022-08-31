require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(name: 'Recipe', preparation_time: 20, cooking_time: 15, description: 'text', public: true, user_id: 1)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should not be over 255 characters' do
    subject.name = 'a' * 256
    expect(subject).to_not be_valid
  end

  it 'preparation time should be an integer value' do
    subject.preparation_time = 'twenty'
    expect(subject).to_not be_valid
  end

  it 'preparation time should be greater then or equal to 1' do
    subject.preparation_time = -2
    expect(subject).to_not be_valid
  end

  it 'cooking time should be an integer value' do
    subject.cooking_time = 'twenty'
    expect(subject).to_not be_valid
  end

  it 'cooking time should be greater then or equal to 1' do
    subject.cooking_time = -2
    expect(subject).to_not be_valid
  end

  it 'public attribute must be a boolean value' do
    subject.cooking_time = 'true'
    expect(subject).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.create(name:'FOOD1',price:3,measurement_unit:'kilos',quantity:3,user_id:1) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end


  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'price  should be integer' do
    subject.price = 'test'
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit  should be integer' do
    subject.measurement_unit = 'test'
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

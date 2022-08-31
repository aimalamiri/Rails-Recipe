require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'User test', email: 'user@test.com', password: 'password') }
  before { subject.save }

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end

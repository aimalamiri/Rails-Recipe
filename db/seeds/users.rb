def seed_users
  5.times do |i|
    User.create(name: "User ##{i}", email: "user#{i}@test.com", password: 'password').encrypted_password
  end
end

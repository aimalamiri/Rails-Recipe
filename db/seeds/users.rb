def seed_users
  5.times do |i|
    User.create(name: "User #{i + 1}", email: "user#{i + 1}@test.com", password: 'password').encrypted_password
  end
end

def seed_recipes
  b = { 0 => true, 1 => false }
  5.times do |i|
    Recipe.create(
      name: "Recipe #{i}",
      preparation_time: rand(10..60),
      cooking_time: rand(10..60),
      description: "Lorem ipsum dolor sit amit #{i}",
      public: b[rand(2)],
      user_id: rand(1..5)
    )
  end
end

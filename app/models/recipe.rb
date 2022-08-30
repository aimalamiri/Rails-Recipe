class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food

  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 1 }
  validates :cooking_time, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 1 }
  validates :description, presence: true, allow_blank: true
  validates :public, inclusion: { in: [true, false] }
end

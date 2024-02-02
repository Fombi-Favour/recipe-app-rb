class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'

  has_many :recipe_foods, foreign_key: :recipe_id

  validates :name, :preparation_time, :cooking_time, :description, presence: true

  def total_price
    total = 0
    recipe_foods.each do |r_food|
      total += (r_food.quantity * r_food.food.price)
    end
    total
  end
end

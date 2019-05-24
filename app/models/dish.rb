class Dish < ApplicationRecord
  belongs_to :menu

  enum dish_type: [:canape, :starter, :main, :dessert]
end

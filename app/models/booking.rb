class Booking < ApplicationRecord
  belongs_to :yatch
  has_many :user
  has_many :beverages
  has_many :menus
end

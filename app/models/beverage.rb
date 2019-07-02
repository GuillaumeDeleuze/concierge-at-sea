class Beverage < ApplicationRecord
  belongs_to :booking

  enum beverage_type: [:tea, :alcohol, :soft_drink, :coffee, :cocktail, :all_day_dining ]

end

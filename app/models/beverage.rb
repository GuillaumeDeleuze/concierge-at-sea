class Beverage < ApplicationRecord
  belongs_to :booking

  enum beverage_type: [:hot_drink, :alcohol, :soft_drink, :all_day_dining]

end

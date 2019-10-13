class Broker < ApplicationRecord
  has_many :users
  has_many :yatches
end

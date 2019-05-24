class Activity < ApplicationRecord
  enum reserved: [:not_reserved, :pending, :accepted]
  belongs_to :yatch
end

class Yatch < ApplicationRecord
    geocoded_by :localisation
    after_validation :geocode
    has_many :bookings
    has_one :tender
    has_many :activities
    belongs_to :broker
end

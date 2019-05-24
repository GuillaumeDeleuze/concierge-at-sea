class Tender < ApplicationRecord
    belongs_to :yatch

    enum called: [:not_called, :pending, :accepted]

end

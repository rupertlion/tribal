class PriceTable < ApplicationRecord
    validates_presence_of :trainees, :pricePoint
    has_many :sessions
    enum pricePoint: { low: 0, medium: 1, high: 2 }
end

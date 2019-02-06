class PriceTable < ApplicationRecord
    validates_presence_of :trainees, :price_point
    has_many :sessions
    enum price_point: { low: 0, medium: 1, high: 2 }
end

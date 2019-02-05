class Session < ApplicationRecord
	validates_presence_of :title, :startDate
	belongs_to :price_table
	enum status: { available: 0, booked: 1, full: 2 }
end

class Session < ApplicationRecord
	validates_presence_of :title, :start_date
	belongs_to :price_table
	has_many :transactions
	enum status: { available: 0, booked: 1, full: 2 }
end

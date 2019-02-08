class Session < ApplicationRecord
	validates_presence_of :title, :start_date
	belongs_to :price_table
	has_many :transactions
	has_and_belongs_to_many :users
	enum status: { scheduled: 0, confirmed: 1, full: 2 }
end

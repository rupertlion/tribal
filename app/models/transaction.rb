class Transaction < ApplicationRecord

	validates_presence_of :amount
	belongs_to :user
	belongs_to :session

end

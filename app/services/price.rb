class Price

	def changeStuff(transaction_id)
		tr = Transaction.find_by_id(transaction_id)
		tr.update_attribute(:payment_status, true)
	end
	handle_asynchronously :changeStuff

end

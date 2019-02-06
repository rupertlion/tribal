class AddPaymentStatusToTransactions < ActiveRecord::Migration[5.2]
	def change
		add_column :transactions, :payment_status, :boolean
		add_column :transactions, :stripe_id, :string
		add_reference :transactions, :session, foreign_key: true
	end
end

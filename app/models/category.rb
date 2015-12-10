class Category < ActiveRecord::Base

	belongs_to :balance, class_name: Balance, foreign_key: 'balance_id'

	has_many :transactions

	validates_presence_of :name

	def find_transactions_summ_in_range(range)
    transactions = self.transactions.select{|t| range.cover?(t.transaction_time)}
    transactions.map(&:summ).inject(0){ |result, elem| result + elem }
	end
end
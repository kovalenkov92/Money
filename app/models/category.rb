class Category < ActiveRecord::Base

	belongs_to :balance, class_name: Balance, foreign_key: 'balance_id'

	has_many :transactions

	validates_presence_of :name

end

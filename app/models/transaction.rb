class Transaction < ActiveRecord::Base

	belongs_to :category, class_name: Category, foreign_key: 'category_id'

	validates :summ, :category_id, :transaction_time, presence: true
  
end

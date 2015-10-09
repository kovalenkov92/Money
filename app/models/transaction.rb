class Transaction < ActiveRecord::Base

	belongs_to :category, class_name: Category, foreign_key: 'category_id'

	validates_presence_of :summ
	
end

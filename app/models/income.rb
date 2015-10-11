class Income < ActiveRecord::Base

  belongs_to :balance, class_name: Balance, foreign_key: 'balance_id'

  validates_presence_of :balance_id
  validates_presence_of :value

end

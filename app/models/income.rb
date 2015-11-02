class Income < ActiveRecord::Base

  belongs_to :balance, class_name: Balance, foreign_key: 'balance_id'

  validates :balance_id, :income_time, :value, presence: true

end

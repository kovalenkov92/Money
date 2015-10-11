class Balance < ActiveRecord::Base

  belongs_to :account, class_name: Account, foreign_key: "account_id"
  has_many :categories
  has_many :incomes

end

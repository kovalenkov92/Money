class AddColumnTransactionTimeToTransactionAndIncome < ActiveRecord::Migration
  def change
    add_column :transactions, :transaction_time, :datetime
    add_column :incomes, :income_time, :datetime
  end
end

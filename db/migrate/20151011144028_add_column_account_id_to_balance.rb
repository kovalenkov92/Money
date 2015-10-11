class AddColumnAccountIdToBalance < ActiveRecord::Migration
  def change
    add_column :balances, :account_id, :integer 
  end
end

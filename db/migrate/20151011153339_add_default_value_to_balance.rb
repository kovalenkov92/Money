class AddDefaultValueToBalance < ActiveRecord::Migration
  def change
    change_column :balances, :value, :float, default: 0
  end
end

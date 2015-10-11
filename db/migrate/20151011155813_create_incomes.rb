class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.float :value, default: 0
      t.integer :balance_id

      t.timestamps null: false
    end
  end
end

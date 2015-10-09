class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :summ
      t.integer :category_id

      t.timestamps null: false
    end
  end
end

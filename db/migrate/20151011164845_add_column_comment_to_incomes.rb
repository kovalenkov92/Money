class AddColumnCommentToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :comment, :text
  end
end

class AddColumnValueToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :value, :float, default: 0
  end
end

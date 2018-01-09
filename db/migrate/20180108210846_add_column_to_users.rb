class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :orders_count, :integer, default: 0
    add_index :users, :orders_count
  end
end

class AddRetiredCountColumnToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :retired_count, :integer, default: 0
  end
end

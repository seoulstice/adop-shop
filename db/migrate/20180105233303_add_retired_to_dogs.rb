class AddRetiredToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :retired, :boolean, default: false
  end
end

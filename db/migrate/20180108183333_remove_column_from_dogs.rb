class RemoveColumnFromDogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :dogs, :category_id 
  end
end

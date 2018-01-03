class AddCategoryToDogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :dogs, :category, foreign_key: true
  end
end

class ChangeImageOnDogs < ActiveRecord::Migration[5.1]
  def change
    change_column :dogs, :image, :text
  end
end

class CreateDogCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :dog_categories do |t|
      t.references :dog, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end

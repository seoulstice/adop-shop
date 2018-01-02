class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :size
      t.integer :weight
      t.boolean :cat_friendly
      t.integer :gender
      t.text :description
      t.integer :price
      t.timestamps
    end
  end
end

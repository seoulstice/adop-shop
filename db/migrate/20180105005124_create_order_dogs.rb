class CreateOrderDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :order_dogs do |t|
      t.references :dog, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end

class AddQuantityToOrderDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :order_dogs, :quantity, :integer
  end
end

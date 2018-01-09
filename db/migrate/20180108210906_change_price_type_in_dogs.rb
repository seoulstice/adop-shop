class ChangePriceTypeInDogs < ActiveRecord::Migration[5.1]
  def change
    change_column :dogs, :price, :decimal 
  end
end

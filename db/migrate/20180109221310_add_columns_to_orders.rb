class AddColumnsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :zipcode, :integer
  end
end

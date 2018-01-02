class AddColumnToDogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :dogs, :carrierwave_images, foreign_key: true
  end
end

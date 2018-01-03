class AddColumnToCarrierwaveImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :carrierwave_images, :dog, foreign_key: true
  end
end

class DropCarrierwaveImages < ActiveRecord::Migration[5.1]
  def change
    drop_table :carrierwave_images
  end
end

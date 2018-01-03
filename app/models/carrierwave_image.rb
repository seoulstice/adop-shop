class CarrierwaveImage < ApplicationRecord
  mount_uploader :asset, AssetUploader
  belongs_to :dog 
end

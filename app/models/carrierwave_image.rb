class CarrierwaveImage < ApplicationRecord
  mount_uploader :asset, AssetUploader
end

class Dog < ApplicationRecord
  has_one :carrierwave_image
  enum size: ["Small", "Medium", "Large"]
  enum gender: ["Male", "Female"]
end

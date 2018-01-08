class Dog < ApplicationRecord
  before_save :generate_slug
  has_many :dog_categories
  has_many :categories, through: :dog_categories
  has_many :order_dogs
  has_many :orders, through: :order_dogs
  has_one :carrierwave_image

  enum size: ["Small", "Medium", "Large"]
  enum gender: ["Male", "Female"]

  private
    def generate_slug
      self.slug = name.parameterize
    end
end

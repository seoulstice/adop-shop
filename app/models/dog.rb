class Dog < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save :generate_slug
  belongs_to :category
  has_many :order_dogs
  has_many :orders, through: :order_dogs

  enum size: ["Small", "Medium", "Large"]
  enum gender: ["Male", "Female"]

  private
    def generate_slug
      self.slug = name.parameterize
    end
end

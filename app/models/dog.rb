class Dog < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save :generate_slug

  has_many :dog_categories
  has_many :categories, through: :dog_categories

  has_many :order_dogs
  has_many :orders, through: :order_dogs

  enum size: ["Small", "Medium", "Large"]
  enum gender: ["Male", "Female"]

  def self.highest_price_within_category
    group(:category_id)
  end
  private
    def generate_slug
      self.slug = name.parameterize
    end
end

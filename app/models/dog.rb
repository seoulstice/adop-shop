class Dog < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save :generate_slug

  validates_uniqueness_of :name

  has_many :dog_categories
  has_many :categories, through: :dog_categories

  has_many :order_dogs
  has_many :orders, through: :order_dogs

  enum size: ["Small", "Medium", "Large"]
  enum gender: ["Male", "Female"]

  scope :sort_dogs, -> {order(:name)}

  private

    def generate_slug
      self.slug = name.parameterize
    end
end

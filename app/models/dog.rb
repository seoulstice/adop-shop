class Dog < ApplicationRecord
  before_save :generate_slug
  belongs_to :category
  has_one :carrierwave_image
  enum size: ["Small", "Medium", "Large"]
  enum gender: ["Male", "Female"]

  private
    def generate_slug
      self.slug = name.parameterize
    end
end

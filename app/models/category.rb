class Category < ApplicationRecord
  before_save :generate_slug
  has_many :dog_categories
  has_many :dogs, through: :dog_categories

  private

    def generate_slug
      self.slug = title.parameterize
    end
end

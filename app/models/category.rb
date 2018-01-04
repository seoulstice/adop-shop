class Category < ApplicationRecord
  before_save :generate_slug
  has_many :dogs

  private

    def generate_slug
      self.slug = title.parameterize
    end
end

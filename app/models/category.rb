class Category < ApplicationRecord
  before_save :generate_slug
  has_many :dog_categories
  has_many :dogs, through: :dog_categories

  def highest_price_item_per_category
    dogs.order("price DESC").first.name
  end

  def orders_by_category
    dogs.joins(:order_dogs).count(:order_id)
  end

  private

    def generate_slug
      self.slug = title.parameterize
    end
end

class OrderDog < ApplicationRecord
  belongs_to :dog
  belongs_to :order

  def self.total_adopted
    sum(:quantity)
  end
end

class OrderDog < ApplicationRecord
  belongs_to :dog
  belongs_to :order
end

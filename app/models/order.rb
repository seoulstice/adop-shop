class Order < ApplicationRecord
  belongs_to :user
  has_many :order_dogs 
  has_many :dogs, through: :order_dogs 
  enum status: ["Ordered", "Paid", "Canceled", "Deleted"]

  def readable_date 
    created_at.strftime("%D") 
  end
end

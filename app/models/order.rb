class Order < ApplicationRecord
  belongs_to :user
  has_many :order_dogs 
  has_many :dogs, through: :order_dogs 
  enum status: ["Ordered", "Paid", "Canceled", "Completed"]

  

  def readable_date 
    created_at.strftime("%D") 
  end

  def completed?
    return false if status == "Ordered" || status == "Paid"
  end

  
end

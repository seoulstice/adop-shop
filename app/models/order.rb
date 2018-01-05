class Order < ApplicationRecord
  belongs_to :user
  enum status: ["Ordered", "Paid", "Canceled", "Deleted"]

  def readable_date 
    created_at.strftime("%D") 
  end
end

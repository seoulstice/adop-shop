class Order < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :order_dogs, dependent: :destroy
  has_many :dogs, through: :order_dogs, dependent: :destroy
  enum status: ["Ordered", "Paid", "Canceled", "Completed"]

  def readable_date
    created_at.strftime("%D")
  end

  def completed?
    return false if status == "Ordered" || status == "Paid"
  end

  def self.orders_by_state
    where(status: "Completed").group(:state).order(:state).count
  end

  def self.arrange_states_by_order_count
    where(status: "Completed").group(:state).order("count_all DESC").count
  end



  def self.count_status
    count = Hash.new(0)
    count.merge(group(:status).count)
  end



end

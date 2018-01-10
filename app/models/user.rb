class User < ApplicationRecord
  before_save :capitalize_state
  has_secure_password
  has_many :orders
  validates :username, presence: true, uniqueness: true
  enum role: ["default", "admin"]

  def self.user_with_most_orders
    order("orders_count DESC").limit(1).first.name
  end

  def capitalize_state
    self.state.upcase!
  end

end

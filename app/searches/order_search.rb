require "searchlight/adapters/action_view"

class OrderSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    @user = User.find(options[:user_id])
    @user.orders.all
  end

  def search_status
    query.where(status: options[:status])
  end
end

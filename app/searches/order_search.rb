require "searchlight/adapters/action_view"

class OrderSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Order.all
  end

  def search_status
    query.where(status: options[:status])
  end
end

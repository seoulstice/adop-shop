require "searchlight/adapters/action_view"

class OrderSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Order.all
  end

  def search_status
    query.where(status: options[:status])
  end

  def search_arrange_states_by_order_count
    query.where(status: "Completed").group(:state).order("count_all DESC").count
  end
end

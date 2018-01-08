module CollectionsHelper

  def order_status_collection
    [["All Orders",""], ["Ordered", "Ordered"], ["Paid", "Paid"], ["Canceled", "Canceled"], ["Completed", "Completed"] ]
  end

end

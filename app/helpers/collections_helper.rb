module CollectionsHelper

  def order_status_collection
    [["All Orders",""], ["Ordered", "Ordered"], ["Paid", "Paid"], ["Canceled", "Canceled"], ["Completed", "Completed"] ]
  end

  def categories_collection
    Category.all.collect{|u| [u.title, u.id]}
  end
end

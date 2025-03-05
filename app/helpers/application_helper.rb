module ApplicationHelper
	def status_label_class(status)
    case status
    when "completed"
      "bg-success"
    when "failed"
      "bg-danger"
    when "refunded"
      "bg-info"
    when "pending"
      "bg-warning"
    else
      "bg-secondary"
    end
  end
  # status_label_class kya hota hai
  # apliction helper kya hota hai.............
end

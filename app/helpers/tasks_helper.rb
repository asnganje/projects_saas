module TasksHelper
  def task_priority(priority)
    case priority
    when "high"
        content_tag(:span, "High", class: "bg-green-700 rounded-full px-2 py-1")
    when "medium"
        content_tag(:span, "Medium", class: "bg-yellow-500 rounded-full px-2 py-1")
    when "low"
        content_tag(:span, "Low", class: "bg-red-500 rounded-full px-2 py-1")
    end
  end
end

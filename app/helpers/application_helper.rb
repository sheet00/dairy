module ApplicationHelper
  def br(str)
    (str).gsub(/(\r\n?)|(\n)/, "<br />")
  end
end

module ApplicationHelper
  def br(str)
    (str).gsub(/(\r\n?)|(\n)/, "<br />")
  end

  def to_strf(datetime)
    datetime.strftime("%Y/%m/%d %H:%M:%S")
  end
end

module ApplicationHelper
  def to_strf(datetime)
    datetime.strftime("%Y/%m/%d %H:%M")
  end
end

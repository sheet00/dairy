module ApplicationHelper
  def to_strf(datetime)
    if datetime
      datetime.strftime("%Y/%m/%d %H:%M")
    end
  end
end

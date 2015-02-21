module DiariesHelper

  def convert_content(str)
    str = br(str)
    str = responsive_embed(str)
    str = Sanitize.clean(str, Sanitize::Config::RELAXED_CUSTOM)
    str.html_safe
  end

  #本文から概要の生成
  #最大124文字
  def get_description(str)
    doc = Nokogiri::HTML(str)
    doc.inner_text.gsub(/\r\n?/, " ").slice(0,64)
  end

  def weather_icon(file_name)
    image_tag("weathers/" + file_name, :size => "22x22", :class => "weather")
  end

  def br(str)
    if str then (str).gsub(/(\r\n?)|(\n)/, "<br />") end
  end

  private
  def responsive_embed(str)
    #<div class="embed-responsive embed-responsive-16by9">
    doc = Nokogiri::HTML(str)
    doc.css("iframe").wrap('<div class="embed-responsive embed-responsive-16by9">')

    doc.to_html
  end

end

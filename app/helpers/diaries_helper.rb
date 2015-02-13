module DiariesHelper

  def convert_content(str)
    str = br(str)
    str = responsive_embed(str)
    str = Sanitize.clean(str, Sanitize::Config::RELAXED_CUSTOM)
    str.html_safe
  end

  private
  def br(str)
    (str).gsub(/(\r\n?)|(\n)/, "<br />")
  end

  def responsive_embed(str)
    #<div class="embed-responsive embed-responsive-16by9">
    doc = Nokogiri::HTML(str)
    doc.css("iframe").wrap('<div class="embed-responsive embed-responsive-16by9">')

    doc.to_html
  end

end

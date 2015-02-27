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

  def last_fm_info
    #sample
    "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=rj&api_key=26ea27392a474f50a2a25225cc6a963d&format=json"

    api_key = Settings.last_fm[:api_key]
    user = Settings.last_fm[:user]

    unless api_key || user then return end

    uri = URI.parse("http://ws.audioscrobbler.com/2.0/")
    uri.query = {
      :method => "user.getrecenttracks",
      :user => user,
      :api_key => api_key,
      :limit => 1,
      :format => :json
    }.to_param

    json = Net::HTTP.get(uri)
    json_hash = JSON.parse(json)
    json_hash = json_hash["recenttracks"]["track"]

    #最初の1再生は配列ではない
    json_hash = json_hash.first if 1 < json_hash.count

    result = {}
    result[:artist] = json_hash["artist"]["#text"]
    result[:name] = json_hash["name"]
    result[:album] = json_hash["album"]["#text"]
    result[:url] = json_hash["url"]
    result[:image] = json_hash["image"][2]["#text"]

    result
  end

  private
  def responsive_embed(str)
    #<div class="embed-responsive embed-responsive-16by9">
    doc = Nokogiri::HTML(str)
    doc.css("iframe").wrap('<div class="embed-responsive embed-responsive-16by9">')

    doc.to_html
  end

end

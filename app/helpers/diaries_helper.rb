module DiariesHelper

  def convert_content(str)
    str = pre_escape(str)
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

  #last.fmからデータ取得
  def get_recent_track
    cache_expire = Settings.last_fm[:expire_hour].to_i.hour
    begin
      info = Rails.cache.fetch("last_fm_recent_track", expires_in: cache_expire) do
        LastFm.new()
      end
    rescue => e
      return nil
    end
  end

  #[Caching with Rails: An overview — Ruby on Rails Guides] http://guides.rubyonrails.org/caching_with_rails.html
  def cache_key_for_lastfm(last_fm)
    last_fm.created_at.to_number
  end


  private
  def responsive_embed(str)
    #<div class="embed-responsive embed-responsive-16by9">
    doc = Nokogiri::HTML(str)
    doc.css("iframe").wrap('<div class="embed-responsive embed-responsive-16by9">')
    doc.css("body").inner_html
  end

  #preタグ内のみエスケープする
  def pre_escape(str)
    tags = str.scan(/<pre>[\s|\S]*?<\/pre>/)
    tags.each do |item|
      item.gsub!(/(<pre>|<\/pre>)/,"")
      escape_item = ERB::Util.html_escape(item)
      escape_item.gsub!(/(^\r\n|\r\n$)/,"")
      str.gsub!(item,escape_item)
    end

    str
  end

end

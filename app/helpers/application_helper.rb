module ApplicationHelper
  def to_strf(datetime)
    if datetime
      datetime.strftime("%Y/%m/%d %H:%M")
    end
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
    json_hash = json_hash["recenttracks"]["track"].first

    result = {}
    result[:artist] = json_hash["artist"]["#text"]
    result[:name] = json_hash["name"]
    result[:album] = json_hash["album"]["#text"]
    result[:url] = json_hash["url"]
    result[:image] = json_hash["image"][2]["#text"]

    result
  end
end

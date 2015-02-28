class LastFm
  attr :artist
  attr :name
  attr :album
  attr :url
  attr :image
  attr :created_at

  def initialize
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

    begin
      json_hash = json_hash["recenttracks"]["track"]

      #最初の1再生は配列ではない
      json_hash = json_hash.first if 1 < json_hash.count

      @artist = json_hash["artist"]["#text"]
      @name = json_hash["name"]
      @album = json_hash["album"]["#text"]
      @url = json_hash["url"]
      @image = json_hash["image"][2]["#text"]
      @created_at = Time::now

      #raise NoMethodError

    rescue NoMethodError
      pp json_hash
      return nil
    end
  end

end

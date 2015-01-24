json.array!(@diaries) do |diary|
  json.extract! diary, :id, :authored_on, :category_id, :title, :body, :wheather_id, :mt_id
  json.url diary_url(diary, format: :json)
end

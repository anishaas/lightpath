json.array!(@lightbulbs) do |lightbulb|
  json.extract! lightbulb, :id, :summary, :video_url, :article_url, :other
  json.url lightbulb_url(lightbulb, format: :json)
end

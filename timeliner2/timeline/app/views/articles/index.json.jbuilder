json.array!(@articles) do |article|
  json.extract! article, :id, :title, :url, :description
  json.url article_url(article, format: :json)
end

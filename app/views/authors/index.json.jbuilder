json.array!(@authors) do |author|
  json.extract! author, :id, :name, :description
  json.url author_url(author, format: :json)
end

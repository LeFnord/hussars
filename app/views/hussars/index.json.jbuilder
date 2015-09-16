json.array!(@hussars) do |hussar|
  json.extract! hussar, :id, :name, :born
  json.url hussar_url(hussar, format: :json)
end

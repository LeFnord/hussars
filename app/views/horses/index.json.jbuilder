json.array!(@horses) do |horse|
  json.extract! horse, :id, :name, :hussar_id
  json.url horse_url(horse, format: :json)
end

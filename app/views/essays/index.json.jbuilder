json.array!(@essays) do |essay|
  json.extract! essay, :id
  json.url essay_url(essay, format: :json)
end

json.array!(@prompts) do |prompt|
  json.extract! prompt, :id
  json.url prompt_url(prompt, format: :json)
end

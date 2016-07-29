json.array!(@characters) do |character|
  json.extract! character, :id, :character_name
  json.url character_url(character, format: :json)
end

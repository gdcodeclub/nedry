json.array!(@offenses) do |offense|
  json.extract! offense, :id
  json.url offense_url(offense, format: :json)
end

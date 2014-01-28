json.array!(@days) do |day|
  json.extract! day, :id, :DayName
  json.url day_url(day, format: :json)
end

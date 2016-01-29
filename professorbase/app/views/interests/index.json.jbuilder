json.array!(@interests) do |interest|
  json.extract! interest, :id, :professor_id, :study_area_id
  json.url interest_url(interest, format: :json)
end

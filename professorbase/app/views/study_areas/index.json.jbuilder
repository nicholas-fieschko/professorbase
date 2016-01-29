json.array!(@study_areas) do |study_area|
  json.extract! study_area, :id, :name
  json.url study_area_url(study_area, format: :json)
end

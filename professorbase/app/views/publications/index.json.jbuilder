json.array!(@publications) do |publication|
  json.extract! publication, :id, :info, :professor_id
  json.url publication_url(publication, format: :json)
end

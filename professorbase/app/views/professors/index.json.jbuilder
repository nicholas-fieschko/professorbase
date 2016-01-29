json.array!(@professors) do |professor|
  json.extract! professor, :id, :name, :title, :address, :phone, :email, :website, :bio, :profile_link, :university_id
  json.url professor_url(professor, format: :json)
end

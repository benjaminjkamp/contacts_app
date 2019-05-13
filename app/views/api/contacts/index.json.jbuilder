json.array! @contacts.each do |contact|
  json.first_name contact.first_name
  json.last_name contact.last_name
  json.email contact.email
  json.phone_number contact.phone_number
  json.created_at contact.created_at
  json.updated_at contact.updated_at
end

# json.formatted do
  json.array! @contacts.each do |contact|
    json.formatted do
      json.name contact.full_name
      json.email contact.email
      json.phone_number contact.phone_number
      json.created_at contact.friendly_created_at
      json.updated_at contact.friendly_updated_at
    end
  end
# end
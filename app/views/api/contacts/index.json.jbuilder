json.array! @contacts.each do |contact|
  json.partial! "contact.json.jbuilder", contact: contact
end

# json.formatted do
  # json.array! @contacts.each do |contact|
  #   json.formatted do
  #     json.name contact.full_name
  #     json.email contact.email
  #     json.phone_number contact.phone_number
  #     json.created_at contact.friendly_created_at
      
  #   end
  # end
# end
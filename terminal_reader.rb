require 'http'

system "clear"

puts "Select a contact to display:"
input = gets.chomp

if input == "1"
  response = HTTP.get("http://localhost:3000/api/contacts")
  first_contact = response.parse
  puts "First Name: #{first_contact["brother_first_name"]}"
  puts "Last Name: #{first_contact["brother_last_name"]}"
  puts "Email: #{first_contact["brother_email"]}"
  puts "Phone Number: #{first_contact["brother_phone_number"]}"
elsif input == "2"
  response = HTTP.get("http://localhost:3000/api/contacts")
  second_contact = response.parse
  puts "First Name: #{second_contact["father_first_name"]}"
  puts "Last Name: #{second_contact["father_last_name"]}"
  puts "Email: #{second_contact["father_email"]}"
  puts "Phone Number: #{second_contact["father_phone_number"]}"
elsif input == "3"
  response = HTTP.get("http://localhost:3000/api/contacts")
  third_contact = response.parse
  puts "First Name: #{third_contact["sister_first_name"]}"
  puts "Last Name: #{third_contact["sister_last_name"]}"
  puts "Email: #{third_contact["sister_email"]}"
  puts "Phone Number: #{third_contact["sister_phone_number"]}"
end
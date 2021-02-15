# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

# City.destroy_all
# User.destroy_all
Listing.destroy_all
Reservation.destroy_all

# # Generate 20 random users with Faker
# 20.times do
#   user = User.create!(email: Faker::Internet.safe_email, phone_number: "06" + Faker::Number.number(digits: 8).to_s, description: Faker::Hipster.sentence(word_count: 10))
# end

# # Generate 10 random cities with Faker
# 10.times do
#   city = City.create!(name: Faker::Address.city, zip_code: Faker::Number.leading_zero_number(digits: 5).to_s)
# end

# Generate 50 listings with Faker
50.times do
  listing = Listing.create!(available_beds: Faker::Number.within(range: 1..8), price: Faker::Number.within(range: 15..300), description: Faker::Lorem.paragraph_by_chars(number: 145, supplemental: false), has_wifi: true, welcome_message: Faker::Hipster.sentence, admin_id: Faker::Number.within(range: 29..48), city_id: Faker::Number.within(range: 2..11))
end
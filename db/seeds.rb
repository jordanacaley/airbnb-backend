# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

City.destroy_all
User.destroy_all
Listing.destroy_all
Reservation.destroy_all

# Generate 20 random users with Faker
20.times do
  user = User.create!(email: Faker::Internet.safe_email, phone_number: "06" + Faker::Number.number(digits: 8).to_s, description: Faker::Hipster.sentence(word_count: 10))
end

# Generate 10 random cities with Faker
10.times do
  city = City.create!(name: Faker::Address.city, zip_code: Faker::Number.leading_zero_number(digits: 5).to_s)
end

# Generate 50 listings with Faker
50.times do
  listing = Listing.create!(available_beds: Faker::Number.within(range: 1..8), price: Faker::Number.within(range: 15..300), description: Faker::Lorem.paragraph_by_chars(number: 145, supplemental: false), has_wifi: true, welcome_message: Faker::Hipster.sentence, admin_id: Faker::Number.within(range: 69..88), city_id: Faker::Number.within(range: 22..31))
end

# For each listing, generate 5 reservations in the past and 5 listings in the future
Listing.all.each do |listing|
  reservation1 = Reservation.create!(start_date: Faker::Date.between(from: '2020-01-01', to: '2020-01-15'), end_date: Faker::Date.between(from: '2020-01-16', to: '2020-01-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation2 = Reservation.create!(start_date: Faker::Date.between(from: '2020-02-01', to: '2020-02-15'), end_date: Faker::Date.between(from: '2020-02-16', to: '2020-02-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation3 = Reservation.create!(start_date: Faker::Date.between(from: '2020-03-01', to: '2020-03-15'), end_date: Faker::Date.between(from: '2020-03-16', to: '2020-03-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation4 = Reservation.create!(start_date: Faker::Date.between(from: '2020-04-01', to: '2020-04-15'), end_date: Faker::Date.between(from: '2020-04-16', to: '2020-04-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation5 = Reservation.create!(start_date: Faker::Date.between(from: '2020-05-01', to: '2020-05-15'), end_date: Faker::Date.between(from: '2020-05-16', to: '2020-05-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation6 = Reservation.create!(start_date: Faker::Date.between(from: '2021-06-01', to: '2021-06-15'), end_date: Faker::Date.between(from: '2021-06-16', to: '2021-06-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation7 = Reservation.create!(start_date: Faker::Date.between(from: '2021-07-01', to: '2021-07-15'), end_date: Faker::Date.between(from: '2021-07-16', to: '2021-07-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation8 = Reservation.create!(start_date: Faker::Date.between(from: '2021-08-01', to: '2021-08-15'), end_date: Faker::Date.between(from: '2021-08-16', to: '2021-08-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation9 = Reservation.create!(start_date: Faker::Date.between(from: '2021-09-01', to: '2021-09-15'), end_date: Faker::Date.between(from: '2021-09-16', to: '2021-09-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
  reservation10 = Reservation.create!(start_date: Faker::Date.between(from: '2021-10-01', to: '2021-10-15'), end_date: Faker::Date.between(from: '2021-10-16', to: '2021-10-28'), guest_id: Faker::Number.within(range: 69..88), listing_id: listing.id)
end


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clear existing bookings to avoid duplicates
Booking.destroy_all

# Array of animal types
animal_types = ['Dog', 'Cat', 'Bird', 'Rabbit', 'Hamster', 'Fish', 'Reptile']

# Create 50 bookings
50.times do
  Booking.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    animal_name: Faker::Creature::Animal.name,
    animal_type: animal_types.sample,
    hours_requested: rand(1..8),
    date_of_service: Faker::Time.between(from: DateTime.now, to: 1.year.from_now),
    price: rand(20..200)
  )
end

puts "Created #{Booking.count} bookings"

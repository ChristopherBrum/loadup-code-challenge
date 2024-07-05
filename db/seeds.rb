require 'faker'

Booking.destroy_all

animal_types = ['Dog', 'Cat']

50.times do
  hours = rand(2..8)
  animal_type = animal_types.sample
  base_price = 20
  hourly_rate = animal_type == 'Dog' ? 10 : 5
  price = base_price + (hours * hourly_rate)

  Booking.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    animal_name: Faker::Creature::Dog.name,
    animal_type: animal_type,
    hours_requested: hours,
    date_of_service: Faker::Time.between(from: Date.tomorrow, to: 1.year.from_now),
    price: price
  )
end

puts "Created #{Booking.count} bookings"

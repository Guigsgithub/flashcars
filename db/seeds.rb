# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all cars"
Car.destroy_all
puts "Destroying all rentals"
Rental.destroy_all
puts "Creating cars"
40.times do 
  car = Car.new(
    model: Faker::Vehicle.make_and_model,
    price: rand(20..99),
    capacity: rand(1..8),
    description: Faker::Vehicle.car_options.join(","),
    location: %w[Paris lyon Bordeaux Marseille Lille Nantes].sample,
    user_id: User.all.ids.sample.to_i
    )
  car.save!
  puts "Created #{car.model}"
end
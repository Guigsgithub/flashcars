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
    location: "#{%w[Paris lyon Bordeaux Marseille Lille Nantes Toulouse Grenoble].sample}",
    user_id: User.all.ids.sample.to_i
    )
  car.save!
  puts "Created #{car.model}"
end

# file = URI.open('https://tof.cx/images/2019/11/22/acff3a8d5f457ffe5e6a60abf2c8a6ac.png')
# lesupplier1 = User.new(email: "barnabelemoulu@gmail.com", password: "password", first_name: "Barnabé", last_name: "Le Moulu", phone_number: "0143306970", birthdate: "1819-12-24", address: "24 Rue Vauvenargues", city: "Paris", zipcode: "75018", bio: "Je suis né des amours interdites d'une chèvre et d'un courtier en assurances. Je suis Légion. J'accepte les paiements en bitcoins.", insta: "https://www.instagram.com/instagram/", linkedin: "https://www.facebook.com/bernard.lemoullec")
# lesupplier1.avatar.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
# lesupplier1.save!
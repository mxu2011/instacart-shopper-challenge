# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FINAL_DATE = DateTime.new(2015, 1, 1).beginning_of_day
SCALAR = 1000

puts "Creating sample applicants..."

SCALAR.times do |i|
  print "\r#{i * 100 / SCALAR}%"

  ShopperApplicant.create(
    first_name: fname = Faker::Name.first_name,
    last_name: lname = Faker::Name.last_name,
    email: "#{fname}.#{lname}@example.com",
    phone_number: Faker::PhoneNumber.phone_number,
    zip_code: Faker::Address.zip_code,
    created_at: rand((FINAL_DATE - 6.months)..FINAL_DATE)
  )

  print "\r#{(i + 1) * 100 / SCALAR}%"
end

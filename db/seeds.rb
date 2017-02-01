# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationStep.destroy_all
ShopperApplicant.destroy_all
Funnel.destroy_all

FINAL_DATE = DateTime.new(2015, 1, 1).beginning_of_day
SCALAR = 1000

puts "Creating sample applicants..."

SCALAR.times do |idx|
  print "\r#{idx * 100 / SCALAR}%"

  ShopperApplicant.create(
    first_name: fname = Faker::Name.first_name,
    last_name: lname = Faker::Name.last_name,
    email: "#{fname}.#{lname}@example.com",
    phone_number: Faker::PhoneNumber.phone_number,
    zip_code: Faker::Address.zip_code,
    created_at: rand((FINAL_DATE - 6.months)..FINAL_DATE)
  )

  print "\r#{(idx + 1) * 100 / SCALAR}%"
end

puts "\nCreating funnel steps..."

Funnel::STEPS.each do |step_name|
  Funnel.find_or_create_by(
    name: step_name.to_s
  )
end

steps = Funnel.all


puts "Completing funnel steps..."

ShopperApplicant.all.each_with_index do |applicant, idx|
  print "\r#{idx * 100 / SCALAR}%"

  steps.each do |step|
    applicant.application_steps.create(
      funnel: step
    )
    break if rand(2) == 0
  end

  print "\r#{(idx + 1) * 100 / SCALAR}%"
end

puts ""

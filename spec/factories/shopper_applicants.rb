FactoryGirl.define do
  factory :shopper_applicant do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence(:email) { |n| "email#{n}@example.com" }
    phone_number Faker::PhoneNumber.phone_number
    zip_code Faker::Address.zip_code
  end
end

require 'faker'

FactoryGirl.define do

  factory :client do
    name Faker::Name.name
    store_id Faker::Number.digit
    balance Faker::Commerce.price
    phone Faker::PhoneNumber.phone_number
    address Faker::Address.street_address
  end

end

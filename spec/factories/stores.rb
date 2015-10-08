FactoryGirl.define do

  factory :store do
    title    Faker::Name.name
    group_id Faker::Number.digit
    phone    Faker::PhoneNumber.phone_number
    landline Faker::PhoneNumber.phone_number
    location Faker::Address.street_address
  end

end

FactoryGirl.define do

  factory :wash_way do
    cloth_id Faker::Number.digit
    title    Faker::Name.name
    price    Faker::Commerce.price
  end

end

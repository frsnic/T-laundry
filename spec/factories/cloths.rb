FactoryGirl.define do

  factory :cloth do
    title Faker::Name.name
    store_id Faker::Number.digit
  end

end

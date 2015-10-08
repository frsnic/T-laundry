FactoryGirl.define do

  factory :order_item do
    order_id    Faker::Number.digit
    cloth_title Faker::Name.name
    price       Faker::Commerce.price
    wash_way    Faker::Name.name
  end

end

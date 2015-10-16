FactoryGirl.define do

  factory :order do
    store_id  Faker::Number.digit
    client_id Faker::Number.digit
    price     Faker::Commerce.price
    user_id   Faker::Number.digit

    factory :order_with_items do
      transient do
        items_count 2
      end

      after(:create) do |order, evaluator|
        create_list(:order_item, evaluator.items_count, order: order)
      end
    end
  end

end

FactoryGirl.define do

  factory :store_user do
    store_id Faker::Number.digit
    user_id  Faker::Number.digit
  end

end

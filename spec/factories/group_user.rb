FactoryGirl.define do

  factory :group_user do
    group_id Faker::Number.digit
    user_id  Faker::Number.digit
  end

end

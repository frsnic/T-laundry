FactoryGirl.define do

  factory :group do
    title     Faker::Name.name
    precision Faker::Number.between(from = 0, to = 2)
  end

end

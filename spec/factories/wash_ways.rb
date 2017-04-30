# == Schema Information
#
# Table name: wash_ways
#
#  id         :integer          not null, primary key
#  cloth_id   :integer          not null
#  title      :string           not null
#  price      :decimal(8, 2)    default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do

  factory :wash_way do
    cloth_id Faker::Number.digit
    title    Faker::Name.name
    price    Faker::Commerce.price
  end

end

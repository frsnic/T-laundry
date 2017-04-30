# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#  phone      :string
#  landline   :string
#  location   :string
#

FactoryGirl.define do

  factory :store do
    title    Faker::Name.name
    group_id Faker::Number.digit
    phone    Faker::PhoneNumber.phone_number
    landline Faker::PhoneNumber.phone_number
    location Faker::Address.street_address
  end

end

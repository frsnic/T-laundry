# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  store_id   :integer          not null
#  name       :string           not null
#  balance    :decimal(8, 2)    default(0.0), not null
#  phone      :string           not null
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'faker'

FactoryGirl.define do

  factory :client do
    name     { Faker::Name.name }
    store_id { Faker::Number.digit }
    balance  { Faker::Commerce.price }
    phone    { Faker::PhoneNumber.phone_number }
    address  { Faker::Address.street_address }
  end

end

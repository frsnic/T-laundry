# == Schema Information
#
# Table name: cloths
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  store_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do

  factory :cloth do
    title    Faker::Name.name
    store_id Faker::Number.digit
  end

end

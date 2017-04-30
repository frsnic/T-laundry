# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  precision  :integer          default(2), not null
#

FactoryGirl.define do

  factory :group do
    title     Faker::Name.name
    precision Faker::Number.between(from = 0, to = 2)
  end

end

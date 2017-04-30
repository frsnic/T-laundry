# == Schema Information
#
# Table name: store_users
#
#  id         :integer          not null, primary key
#  store_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do

  factory :store_user do
    store_id Faker::Number.digit
    user_id  Faker::Number.digit
  end

end

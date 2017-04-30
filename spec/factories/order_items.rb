# == Schema Information
#
# Table name: order_items
#
#  id               :integer          not null, primary key
#  order_id         :integer          not null
#  price            :decimal(8, 2)    default(0.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :integer          default(0), not null
#  fetched_at       :datetime
#  wash_way         :string           not null
#  category_id      :integer
#  category_item_id :integer
#

FactoryGirl.define do

  factory :order_item do
    order_id    Faker::Number.digit
    cloth_title Faker::Name.name
    price       Faker::Commerce.price
    wash_way    Faker::Name.name
  end

end

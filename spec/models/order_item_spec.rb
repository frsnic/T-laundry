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

require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:order_item).valid?).to be true
  end

  it "is invalid without a cloth_title" do
    expect(FactoryGirl.build(:order_item, cloth_title: nil).valid?).to be false
  end

  it "is invalid without a price" do
    expect(FactoryGirl.build(:order_item, price: nil).valid?).to be false
  end

  it "is invalid when price greater than 100000" do
    expect(FactoryGirl.build(:order_item, price: 5000000).valid?).to be false
  end

  it "is invalid when price less than 0" do
    expect(FactoryGirl.build(:order_item, price: -50).valid?).to be false
  end

  it "new record default status should be processing" do
    expect(OrderItem.new.status).to eq "processing"
  end

  it "change order_item's role will not be reover (default is processing)" do
    order_item = FactoryGirl.create(:order_item)
    order_item.update(status: OrderItem.statuses[:out])
    expect(order_item.status).to eq "out"
  end

end

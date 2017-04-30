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

require 'rails_helper'

RSpec.describe WashWay, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:wash_way).valid?).to be true
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:wash_way, title: nil).valid?).to be false
  end

  it "allow duplicate title in different cloth per wash_way" do
    FactoryGirl.create(:wash_way, title: "wash_way_title", cloth_id: 1)
    expect(FactoryGirl.build(:wash_way, title: "wash_way_title", cloth_id: 2).valid?).to be true
  end

  it "does not allow duplicate title in same cloth per wash_way" do
    FactoryGirl.create(:wash_way, title: "wash_way_title", cloth_id: 1)
    expect(FactoryGirl.build(:wash_way, title: "wash_way_title", cloth_id: 1).valid?).to be false
  end

  it "is invalid without a price" do
    expect(FactoryGirl.build(:wash_way, price: nil).valid?).to be false
  end

  it "is invalid when price greater than 10000" do
    expect(FactoryGirl.build(:wash_way, price: 5000000).valid?).to be false
  end

  it "is invalid when price less than 0" do
    expect(FactoryGirl.build(:wash_way, price: -50).valid?).to be false
  end

end

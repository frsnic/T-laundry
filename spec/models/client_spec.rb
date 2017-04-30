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

require 'rails_helper'

RSpec.describe Client, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:client).valid?).to be true
  end

  it "is invalid without a store_id" do
    expect(FactoryGirl.build(:client, store_id: nil).valid?).to be false
  end

  it "is invalid without a phone" do
    expect(FactoryGirl.build(:client, phone: nil).valid?).to be false
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:client, name: nil).valid?).to be false
  end

  it "is invalid without a balance" do
    expect(FactoryGirl.build(:client, balance: nil).valid?).to be false
  end

  it "is invalid when balance greater than 100000" do
    expect(FactoryGirl.build(:client, balance: 5000000).valid?).to be false
  end

  it "allow duplicate phone numbers in different stores per client" do
    FactoryGirl.create(:client, phone: "785-555-1234", store_id: 1)
    expect(FactoryGirl.build(:client, phone: "785-555-1234", store_id: 2).valid?).to be true
  end

  it "does not allow duplicate phone numbers in same store per client" do
    FactoryGirl.create(:client, phone: "785-555-1234", store_id: 1)
    expect(FactoryGirl.build(:client, phone: "785-555-1234", store_id: 1).valid?).to be false
  end

end

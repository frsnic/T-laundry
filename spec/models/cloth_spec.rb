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

require 'rails_helper'

RSpec.describe Cloth, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:cloth).valid?).to be true
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:cloth, title: nil).valid?).to be false
  end

  it "is invalid without a store_id" do
    expect(FactoryGirl.build(:cloth, store_id: nil).valid?).to be false
  end

  it "allow duplicate title in different stores per cloth" do
    FactoryGirl.create(:cloth, title: "cloth_title", store_id: 1)
    expect(FactoryGirl.build(:cloth, title: "cloth_title", store_id: 2).valid?).to be true
  end

  it "does not allow duplicate title in same store per cloth" do
    FactoryGirl.create(:cloth, title: "cloth_title", store_id: 1)
    expect(FactoryGirl.build(:cloth, title: "cloth_title", store_id: 1).valid?).to be false
  end

end

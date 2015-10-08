require 'rails_helper'

RSpec.describe Group, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:group).valid?).to be true
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:group, title: nil).valid?).to be false
  end

  it "does not allow duplicate title per group" do
    FactoryGirl.create(:group, title: "group_title")
    expect(FactoryGirl.build(:group, title: "group_title").valid?).to be false
  end

  it "is invalid without a precision" do
    expect(FactoryGirl.build(:group, precision: nil).valid?).to be false
  end

  it "is invalid when precision < 0" do
    expect(FactoryGirl.build(:group, precision: -1).valid?).to be false
  end

  it "is invalid when precision > 2" do
    expect(FactoryGirl.build(:group, precision: 3).valid?).to be false
  end

end

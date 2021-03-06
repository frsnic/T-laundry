require "rails_helper"

RSpec.describe Store do

  it "has a valid factory" do
    expect(FactoryGirl.create(:store).valid?).to be true
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:store, title: nil).valid?).to be false
  end

  it "allow duplicate title in different group per store" do
    FactoryGirl.create(:store, title: "store_title", group_id: 1)
    expect(FactoryGirl.build(:store, title: "store_title", group_id: 2).valid?).to be true
  end

  it "does not allow duplicate title in same group per store" do
    FactoryGirl.create(:store, title: "store_title", group_id: 1)
    expect(FactoryGirl.build(:store, title: "store_title", group_id: 1).valid?).to be false
  end

end

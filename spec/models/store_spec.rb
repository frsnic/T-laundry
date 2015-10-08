require "rails_helper"

RSpec.describe StoreUser do

  it "has a valid factory" do
    expect(FactoryGirl.create(:store_user).valid?).to be true
  end

  it "is invalid without a store_id" do
    expect(FactoryGirl.build(:store_user, store_id: nil).valid?).to be false
  end

  it "is invalid without a user_id" do
    expect(FactoryGirl.build(:store_user, user_id: nil).valid?).to be false
  end

end

require 'rails_helper'

RSpec.describe StoreUser, type: :model do

  it "has none to begin with" do
    expect(StoreUser.count).to eq 0
  end

  it "has one after adding one" do
    StoreUser.create(store_id: 1, user_id: 1)
    expect(StoreUser.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(StoreUser.count).to eq 0
  end

end

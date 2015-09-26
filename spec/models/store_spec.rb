require 'rails_helper'

RSpec.describe Store, type: :model do

  it "has none to begin with" do
    expect(Store.count).to eq 0
  end

  it "has one after adding one" do
    Store.create(title: SecureRandom.hex, group_id: 1)
    expect(Store.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Store.count).to eq 0
  end

end

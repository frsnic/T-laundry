require 'rails_helper'

RSpec.describe ClothWay, type: :model do

  it "has none to begin with" do
    expect(ClothWay.count).to eq 0
  end

  it "has one after adding one" do
    ClothWay.create(cloth_id: 1, title: SecureRandom.hex)
    expect(ClothWay.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(ClothWay.count).to eq 0
  end

end

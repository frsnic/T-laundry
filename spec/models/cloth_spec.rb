require 'rails_helper'

RSpec.describe Cloth, type: :model do

  it "has none to begin with" do
    expect(Cloth.count).to eq 0
  end

  it "has one after adding one" do
    Cloth.create(title: 'Cloth Title', store_id: 1)
    expect(Cloth.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Cloth.count).to eq 0
  end

end

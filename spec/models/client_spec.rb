require 'rails_helper'

RSpec.describe Client, type: :model do

  it "has none to begin with" do
    expect(Client.count).to eq 0
  end

  it "has one after adding one" do
    Client.create(name: 1, store_id: 1, phone: '09123456789')
    expect(Client.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Client.count).to eq 0
  end

end

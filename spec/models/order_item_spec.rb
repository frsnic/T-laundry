require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  it "has none to begin with" do
    expect(OrderItem.count).to eq 0
  end

  it "has one after adding one" do
    OrderItem.create(order_id: 1, cloth_title: 'Cloth Title')
    expect(OrderItem.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(OrderItem.count).to eq 0
  end

  it "new default status should be processing" do
    expect(OrderItem.new.status).to eq "processing"
  end

end

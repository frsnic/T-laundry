require "rails_helper"

RSpec.describe Group do

  it "has none to begin with" do
    expect(Group.count).to eq 0
  end

  it "has one after adding one" do
    Group.create(title: SecureRandom.hex)
    expect(Group.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Group.count).to eq 0
  end

end

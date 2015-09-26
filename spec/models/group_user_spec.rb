require "rails_helper"

RSpec.describe GroupUser do

  it "has none to begin with" do
    expect(GroupUser.count).to eq 0
  end

  it "has one after adding one" do
    GroupUser.create(group_id: 1, user_id: 1)
    expect(GroupUser.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(GroupUser.count).to eq 0
  end

end

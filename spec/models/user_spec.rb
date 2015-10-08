require "rails_helper"

RSpec.describe User do

  it "has a valid factory" do
    expect(FactoryGirl.create(:user).valid?).to be true
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:user, name: nil).valid?).to be false
  end

  it "new record default role should be client" do
    expect(User.new.role).to eq "client"
  end

  it "change user's role will not be reover (default is client)" do
    user = FactoryGirl.create(:user)
    user.update(role: User.roles[:admin])
    expect(user.role).to eq "admin"
  end

end

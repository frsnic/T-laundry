require "rails_helper"

RSpec.describe User do

  it "has none to begin with" do
    expect(User.count).to eq 0
  end

  it "has one after adding one" do
    random_string = SecureRandom.hex
    User.create({
      email: random_string + '@gmail.com',
      password: random_string,
      password_confirmation: random_string,
      name: random_string
    })
    expect(User.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(User.count).to eq 0
  end

  it "new default role should be client" do
    expect(User.new.role).to eq "client"
  end

end

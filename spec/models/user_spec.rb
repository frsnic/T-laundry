require "rails_helper"

RSpec.describe User do

  it "create" do
    require 'securerandom'
    random_string = SecureRandom.hex
    user = User.new({
      email: random_string + '@gmail.com',
      password: random_string,
      password_confirmation: random_string,
      name: random_string
    })

    expect(user.valid?).to eq(true)
  end

end

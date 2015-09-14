require "rails_helper"

RSpec.describe Group do

  it "create" do
    require 'securerandom'
    random_string = SecureRandom.hex
    group = Group.new({
      title: random_string
    })

    expect(group.valid?).to eq(true)
  end

end

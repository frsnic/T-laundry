require "rails_helper"

RSpec.describe GroupUser do

  it "create" do
    group_user = GroupUser.create({
      user_id: 1,
      group_id: 1
    })

    expect(group_user.valid?).to eq(true)
  end

end

# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  group_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe GroupUser do

  it "has a valid factory" do
    expect(FactoryGirl.create(:group_user).valid?).to be true
  end

  it "is invalid without a group_id" do
    expect(FactoryGirl.build(:group_user, group_id: nil).valid?).to be false
  end

  it "is invalid without a user_id" do
    expect(FactoryGirl.build(:group_user, user_id: nil).valid?).to be false
  end

end

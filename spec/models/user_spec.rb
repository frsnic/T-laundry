# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  role                   :integer          not null
#

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

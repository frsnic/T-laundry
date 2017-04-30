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

class GroupUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :user_id, :group_id, presence: true

end

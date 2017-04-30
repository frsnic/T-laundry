# == Schema Information
#
# Table name: store_users
#
#  id         :integer          not null, primary key
#  store_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StoreUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :store

  validates :user_id, :store_id, presence: true

end

# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#  phone      :string
#  landline   :string
#  location   :string
#

class Store < ActiveRecord::Base
  has_many :store_users, dependent: :destroy
  has_many :store_managers, through: :store_users, source: :user, dependent: :destroy
  belongs_to :group
  has_many :orders, dependent: :destroy
  has_many :clients
  has_many :cloths, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :group_id }

end

class Group < ActiveRecord::Base
  has_many :group_users, dependent: :destroy
  has_many :group_managers, through: :group_users, source: :user
  has_many :stores, dependent: :destroy

  validates_uniqueness_of :title
  validates :title, presence: true

end

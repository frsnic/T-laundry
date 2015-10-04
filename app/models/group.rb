class Group < ActiveRecord::Base
  has_many :group_users, dependent: :destroy
  has_many :group_managers, through: :group_users, source: :user
  has_many :stores, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :precision, presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0, less_than: 3 }

end

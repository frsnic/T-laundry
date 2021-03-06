class Group < ActiveRecord::Base
  has_many :group_users, dependent: :destroy
  has_many :group_managers, through: :group_users, source: :user
  has_many :stores, dependent: :destroy
  has_many :cloths

  validates :title, presence: true, uniqueness: true
  validates :precision, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 3 }

end

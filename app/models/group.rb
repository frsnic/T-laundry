class Group < ActiveRecord::Base
  has_many :group_users, dependent: :destroy
  has_many :group_members, through: :group_users, source: :user

  after_create :add_admin_to_group

  validates_uniqueness_of :title
  validates :title, presence: true

  def add_admin_to_group
    User.where(role: 'admin').each {|user| user.groups << self}
  end

end

class Group < ActiveRecord::Base
  has_many :group_users, dependent: :destroy
  has_many :members, through: :group_users, source: :user

  after_create :add_admin_to_group

  def set_default_role
    self.role ||= :client
  end

  def add_admin_to_group
    User.where(role: 'admin').each {|user| user.groups << self}
  end

end

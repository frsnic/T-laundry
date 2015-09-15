class Group < ActiveRecord::Base
  has_many :group_users
  has_many :members, through: :group_users, source: :user

  after_create :admin_add_group

  def set_default_role
    self.role ||= :client
  end

  def admin_add_group
    User.where(role: 'admin').each {|user| GroupUser.create(user_id: user.id, group_id: self.id)}
  end

end

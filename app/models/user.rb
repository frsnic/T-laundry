class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users, source: :group

  validates :name, presence: true

  enum role: [:admin, :group_manager, :store_manager, :sales, :client]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end

end

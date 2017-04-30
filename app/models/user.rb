class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users, source: :group
  has_many :store_users, dependent: :destroy
  has_many :stores, through: :store_users, source: :store
  has_many :orders

  validates :name, presence: true

  enum role: [:admin, :group_manager, :store_manager, :client]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :admin
  end

end

class Store < ActiveRecord::Base
  has_many :store_users, dependent: :destroy
  has_many :store_managers, through: :store_users, source: :user, dependent: :destroy
  belongs_to :groups

  after_create :add_admin_to_store

  validates :title, presence: true

  def add_admin_to_store
    User.where(role: 'admin').each {|user| user.stores << self}
  end

end

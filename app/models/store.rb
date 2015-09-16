class Store < ActiveRecord::Base
  has_many :store_users, dependent: :destroy
  has_many :store_managers, through: :store_users, source: :user, dependent: :destroy
  belongs_to :group

  validates :title, presence: true

  default_scope { order('group_id ASC, created_at ASC') }

end

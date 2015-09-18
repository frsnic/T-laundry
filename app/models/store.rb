class Store < ActiveRecord::Base
  has_many :store_users, dependent: :destroy
  has_many :store_managers, through: :store_users, source: :user, dependent: :destroy
  belongs_to :group
  has_many :orders, dependent: :destroy

  validates :title, presence: true

end

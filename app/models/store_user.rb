class StoreUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :store

  validates :user_id, :store_id, presence: true

end

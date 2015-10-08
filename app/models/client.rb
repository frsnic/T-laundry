class Client < ActiveRecord::Base
  belongs_to :store
  has_many :orders, dependent: :destroy

  validates :store_id, :name, presence: true
  validates :balance, presence: true, numericality: { less_than: 100000 }
  validates :phone, presence: true, uniqueness: { scope: :store_id }

end

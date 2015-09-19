class Order < ActiveRecord::Base
  belongs_to :store
  belongs_to :client
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :user_id, :store_id, :client_id, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 100000 }

end

class Client < ActiveRecord::Base
  belongs_to :store
  has_many :orders, dependent: :destroy
  has_many :order_items, through: :orders, source: :order_items

  validates :store_id, :phone, :name, presence: true
  validates :balance, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { less_than: 100000 }
  validates_uniqueness_of :phone, :scope => :store_id

end

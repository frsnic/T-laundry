class Client < ActiveRecord::Base
  belongs_to :store
  has_many :orders, dependent: :destroy

  validates :store_id, :phone, :name, presence: true
  validates :balance, presence: true, numericality: { less_than: 100000 }
  validates_uniqueness_of :phone, :scope => :store_id

end

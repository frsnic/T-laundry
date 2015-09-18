class Client < ActiveRecord::Base
  belongs_to :store

  validates :store_id, :phone, presence: true
  validates :balance, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { less_than: 100000 }
  validates_uniqueness_of :phone, :scope => :store_id

end

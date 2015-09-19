class OrderItem < ActiveRecord::Base
  belongs_to :order

  validates :order_id, :cloth_name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :sum, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

end

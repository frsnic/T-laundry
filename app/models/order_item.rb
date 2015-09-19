class OrderItem < ActiveRecord::Base
  belongs_to :order

  validates :order_id, :cloth_name, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  after_save :update_order_price

  def update_order_price
    self.order.update(price: self.order.order_items.sum(:price))
  end

end

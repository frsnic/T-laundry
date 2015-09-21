class OrderItem < ActiveRecord::Base
  belongs_to :order

  validates :cloth_name, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

end

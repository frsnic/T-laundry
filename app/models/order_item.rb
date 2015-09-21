class OrderItem < ActiveRecord::Base
  belongs_to :order

  validates :cloth_title, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  def is_fetch
  end

end

# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  store_id   :integer          not null
#  client_id  :integer          not null
#  price      :decimal(8, 2)    default(0.0), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :store
  belongs_to :client
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :user_id, :store_id, :client_id, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
    numericality: { greater_than_or_equal_to: 0, less_than: 100000 }

  accepts_nested_attributes_for :order_items, allow_destroy: true

  def status
    return OrderItem.statuses.key(self.order_items.pluck(:status).uniq.min)
  end

  def fetched_at
    fetched_times = self.order_items.pluck(:fetched_at).uniq
    return ([nil, ""] & fetched_times).present? ? "" : (fetched_times - [nil, ""]).max
  end

end

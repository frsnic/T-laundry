# == Schema Information
#
# Table name: order_items
#
#  id               :integer          not null, primary key
#  order_id         :integer          not null
#  price            :decimal(8, 2)    default(0.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :integer          default(0), not null
#  fetched_at       :datetime
#  wash_way         :string           not null
#  category_id      :integer
#  category_item_id :integer
#

class OrderItem < ActiveRecord::Base
  belongs_to :order

  validates :cloth_title, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
    numericality: { greater_than_or_equal_to: 0, less_than: 100000 }

  enum status: [:processing, :finish, :out]

  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :processing
  end

end

class OrderItem < ActiveRecord::Base
  belongs_to :order
  delegate :client, to: :order

  validates :cloth_title, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 0, less_than: 100000 }

  enum status: [:processing, :finish, :out]

  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :processing
  end

  def is_fetch
  end

end

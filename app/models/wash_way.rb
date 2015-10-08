class WashWay < ActiveRecord::Base
  belongs_to :cloth

  validates :title, presence: true, uniqueness: { scope: :cloth_id }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 0, less_than: 10000  }

end

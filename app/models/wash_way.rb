# == Schema Information
#
# Table name: wash_ways
#
#  id         :integer          not null, primary key
#  cloth_id   :integer          not null
#  title      :string           not null
#  price      :decimal(8, 2)    default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WashWay < ActiveRecord::Base
  belongs_to :cloth

  validates :title, presence: true, uniqueness: { scope: :cloth_id }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
    numericality: { greater_than_or_equal_to: 0, less_than: 10000  }

end

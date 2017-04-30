# == Schema Information
#
# Table name: cloths
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  store_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cloth < ActiveRecord::Base
  belongs_to :store
  has_many :wash_ways, dependent: :destroy

  validates :title, :store_id, presence: true
  validates_uniqueness_of :title, :scope => :store_id

  accepts_nested_attributes_for :wash_ways, allow_destroy: true

end

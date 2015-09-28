class Cloth < ActiveRecord::Base
  belongs_to :group
  has_many :wash_ways, dependent: :destroy

  validates :title, :group_id, presence: true
  validates_uniqueness_of :title, :scope => :group_id

  accepts_nested_attributes_for :wash_ways, allow_destroy: true

end

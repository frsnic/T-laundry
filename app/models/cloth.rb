class Cloth < ActiveRecord::Base
  belongs_to :group

  validates :title, :group_id, presence: true
  validates_uniqueness_of :title, :scope => :group_id

end

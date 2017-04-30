# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  store_id   :integer          not null
#  name       :string           not null
#  balance    :decimal(8, 2)    default(0.0), not null
#  phone      :string           not null
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ActiveRecord::Base
  belongs_to :store
  has_many :orders, dependent: :destroy

  validates :store_id, :name, presence: true
  validates :balance, presence: true, numericality: { less_than: 100000 }
  validates :phone, presence: true, uniqueness: { scope: :store_id }

end

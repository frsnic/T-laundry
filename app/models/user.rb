# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  role                   :integer          not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users, source: :group
  has_many :store_users, dependent: :destroy
  has_many :stores, through: :store_users, source: :store
  has_many :orders

  validates :name, presence: true

  enum role: [:admin, :group_manager, :store_manager, :client]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :admin
  end

end

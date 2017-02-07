class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :groups_users
  has_many :groups_users, dependent: :destroy

  validates :name, presence: true, uniquness: true

end

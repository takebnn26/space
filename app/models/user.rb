class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  has_many :groups, through: :group_users
  has_many :group_users, dependent: :destroy

  validates :name, presence: true, uniquness: true
=======
  validates :name, presence: true, uniqueness: true
>>>>>>> master

end

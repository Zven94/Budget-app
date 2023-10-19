class User < ApplicationRecord
  has_one_attached :icon
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :entities
  has_many :groups

  validates :name, presence: true
end

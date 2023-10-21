class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :groups
  has_one_attached :icon
  validates :name, presence: true
end

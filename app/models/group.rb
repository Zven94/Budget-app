class Group < ApplicationRecord
  has_many :entities
  belongs_to :user
  belongs_to :entity, optional: true
  has_one_attached :icon
end

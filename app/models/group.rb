class Group < ApplicationRecord
  belongs_to :user
  belongs_to :entity, optional: true
  has_one_attached :icon
end

class User < ApplicationRecord
  has_many :entity
  has_many :group
end

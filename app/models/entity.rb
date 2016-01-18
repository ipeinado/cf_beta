class Entity < ActiveRecord::Base
  validates :name, presence: true
  validates :bio, length: { maximum: 255 }
end

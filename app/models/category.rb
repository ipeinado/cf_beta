class Category < ActiveRecord::Base
  has_many :categorizings
  has_many :promos, through: :categorizings

  validates :name, presence: true, uniqueness: { case_sensitive: true }
end

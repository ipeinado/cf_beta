class Category < ActiveRecord::Base
  has_many :categorizings, dependent: :destroy
  has_many :promos, through: :categorizings

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end

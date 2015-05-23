class Post < ActiveRecord::Base

  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :title,
  	presence: true,
  	length: { maximum: 255 }

  validates :body,
  	presence: true

  validates :user_id,
  	presence: true
end

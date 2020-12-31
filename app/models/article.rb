class Article < ApplicationRecord
  has_many :star_users, through: :stars, source: :user
  belongs_to :user
  has_one_attached :picture
  default_scope { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence:true, length: { maximum: 2000 }
  validates :user_id, presence: true
end

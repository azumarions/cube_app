class Article < ApplicationRecord
  has_many :stars, dependent: :destroy
  has_many :star_users, through: :stars, source: :user
  belongs_to :user
  has_one_attached :picture
  default_scope { order(created_at: :desc) }
  validates :user_id, presence: true

   def star(user)
    stars.create(user_id: user.id)
  end

  def unstar(user)
    stars.find_by(user_id: user.id).destroy
  end

  def star?(user)
    star_users.include?(user)
  end
end

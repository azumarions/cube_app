class Micropost < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  belongs_to :user
  has_one_attached :picture
  default_scope { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :comment, presence: true, length: { maximum: 255 }
  validate :validate_picture

  def resize_picture
    return self.picture.variant(resize: '100x100').processed
  end

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  def like?(user)
    like_users.include?(user)
  end

  private
    def validate_picture
      if picture.attached?
        if !picture.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))
          errors.add(:picture, 'はjpeg, jpg, png, gif以外の投稿ができません')
        elsif picture.blob.byte_size > 5.megabytes
          errors.add(:picture, "のサイズが5MBを超えています")
        end
      end
    end
end

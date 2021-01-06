class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_one :profile
  has_many :articles, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :clocks, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy                                
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :username,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }

  def self.guest
    user = User.find(1)
  end
  
  def feed
    Article.where("user_id = ?", id)
  end

  def micropost_feed
    Micropost.where("user_id = ?", id)
  end

  def clock_feed
    Clock.where("user_id = ?", id)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end

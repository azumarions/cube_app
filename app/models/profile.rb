class Profile < ApplicationRecord
    belongs_to :user
    mount_uploader :avatar, ProfileAvatarUploader
    validates :name, presence: true
    validates :avatar, presence: true
end

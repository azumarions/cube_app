class Clock < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :hour, presence: true
    default_scope -> { order(hour: :asc) }
end

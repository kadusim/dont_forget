class Favorite < ApplicationRecord
  belongs_to :user_follower, class_name: 'User'
  belongs_to :list_followed, class_name: 'List'

  validates :user_follower_id, presence: true
  validates :list_followed_id, presence: true
end

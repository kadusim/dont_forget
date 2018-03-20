class User < ApplicationRecord

  # has_many :follows
  # has_many :lists, through: :follows
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists, dependent: :destroy

  has_many :active_favorites, class_name:  'Favorite',
                              foreign_key: 'user_follower_id',
                              dependent:   :destroy
  has_many :following, through: :active_favorites, source: :list_followed

  # Follows a list.
  def follow(list)
    following << list
  end

  # Unfollows a list.
  def unfollow(list)
    following.delete(list)
  end

  # Returns true if the current user is following the lists.
  def following?(list)
    following.include?(list)
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"


  # Have a method that returns all of a user's friends, no matter who sent the friend request.

  def friends
    friends = friendships.map { |friendship| friendship.friend if friendship.status }
    friends + inverse_friendships.map { |friendship| friendship.user if friendship.status }
    friends.compact
  end

  def confirm_friendship
    friendship = inverse_friendships.find { |friendship| friendship.user === user }
    frienship.status = true
    friendship.save
  end

  def is_friend?
    friends.include?(user)
  end

end

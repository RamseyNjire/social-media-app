class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy


  # Have a method that returns all of a user's friends, no matter who sent the friend request

  def friends
    friends = friendships.map { |friendship| friendship.friend if friendship.status }
    friends += inverse_friendships.map { |friendship| friendship.user if friendship.status }
    friends.compact
  end

  # This method lists a user's sent friendship requests

  def sent_requests
    friendships.map { |friendship| friendship.friend if !friendship.status}.compact
  end

  # This method lists a user's pending friendship requests (those sent by others that a user is yet to confirm)

  def pending_requests
    inverse_friendships.map { |friendship| friendship.user if !friendship.status }.compact
  end

  # This method enables a user to confirm a friend request

  def confirm_friendship(user)
    friendship = inverse_friendships.find { |friendship| friendship.user === user }
    friendship.status = true
    friendship.save
  end

  # This method checks if the given user is a friend of the current user

  def is_friend?(user)
    friends.include?(user)
  end

end

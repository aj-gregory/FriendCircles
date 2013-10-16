class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :user_ids
  validates :name, :presence => true

  has_many :friend_circle_memberships
  has_many :users, :through => :friend_circle_memberships
  has_many :post_shares
  has_many :posts, :through => :post_shares
end

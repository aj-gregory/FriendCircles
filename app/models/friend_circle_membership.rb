class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :friend_circle_id, :user_id

  belongs_to :user
  belongs_to :friend_circle
end

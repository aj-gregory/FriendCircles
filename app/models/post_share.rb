class PostShare < ActiveRecord::Base
  attr_accessible :friend_circle_id, :post_id

  validates :friend_circle_id, :presence => true

  belongs_to :friend_circle
  belongs_to :post
end

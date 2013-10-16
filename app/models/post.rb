class Post < ActiveRecord::Base
  attr_accessible :body, :user_id, :friend_circle_ids, :link

  validates :body, :user_id, :presence => nil

  belongs_to :user
  has_many :links, :inverse_of => :post
  has_many :post_shares, :inverse_of => :post
  has_many :friend_circles, :through => :post_shares
end

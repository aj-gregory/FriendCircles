class Link < ActiveRecord::Base
  attr_accessible :post_id, :url

  validates :url, :presence => true

  belongs_to :post
end

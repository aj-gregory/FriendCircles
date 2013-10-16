class User < ActiveRecord::Base
  attr_accessible :email, :password, :session_token
  attr_reader :password

  before_validation :on => :create do
    generate_session_token if session_token.nil?
  end

  validates :email, :password_digest, :session_token, :presence => true
  validates :email, :uniqueness => true
  validates :password, :length => {:minimum => 6}, :on => :create

  has_many :friend_circle_memberships
  has_many :friend_circles, :through => :friend_circle_memberships
  has_many :posts

  def generate_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
    #fail
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

end

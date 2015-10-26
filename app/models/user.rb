class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :goals

  has_many(:authored_comments,
  class_name: "UserComment",
  foreign_key: :author_id,
  primary_key: :id)

  has_many(:profile_comments,
  class_name: "UserComment",
  foreign_key: :profile_id,
  primary_key: :id)

  has_many(:authored_goal_comments,
  class_name: "GoalComment",
  foreign_key: :author_id,
  primary_key: :id)

  attr_reader :password

  def self.find_by_credentials(username, password)
    @user = User.find_by_username(username)
    return nil unless @user && @user.is_password?(password)
    @user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

end

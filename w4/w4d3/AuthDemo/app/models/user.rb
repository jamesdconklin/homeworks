class User < ActiveRecord::Base

  private

  attr_reader :password

  public

  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {
    message: "Password can't be blank."
  }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = self.find_by(username: username)
    return user if user && user.is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    update!(session_token: self.class.generate_session_token)
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


  def password=(pass)
    @password = pass
    self.password_digest ||= BCrypt::Password.create(pass)
  end


  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end
end

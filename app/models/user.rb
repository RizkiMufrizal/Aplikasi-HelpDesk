class User < ActiveRecord::Base

  attr_accessor :password
  validates_confirmation_of :password

  before_save :ecrypt_password

  private
    def ecrypt_password
      self.enable = false
      self.role = "ROLE_USER"
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hast = BCrypt::Engine.hash_secret(password, password_salt)
    end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hast == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end

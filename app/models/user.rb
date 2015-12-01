class User < ActiveRecord::Base

  before_save :ecrypt_password

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private
    def ecrypt_password
      self.enable = false
      self.role = "ROLE_USER"
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password_hash, password_salt)
    end

end

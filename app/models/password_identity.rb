class PasswordIdentity < Identity
  alias_attribute :email, :pwd_email
  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password

  before_save :encrypt_password

  validates :password_confirmation, :presence => true
  validates :password, :presence => true, :confirmation => true
  validates :email, :presence => true

  def email=(value)
    self[:pwd_email] = value.downcase
  end

  class << self
    def authenticate!(options = {})
      password = options[:password]
      identity = PasswordIdentity.find_by_pwd_email(options[:email]) rescue nil
      return false unless identity

      if identity.pwd_encrypted_password == BCrypt::Engine.hash_secret(password, identity.pwd_password_salt)
        return identity.user
      end

      return false
    end
  end

  private
  def encrypt_password
    if password.present?
      self.pwd_password_salt = BCrypt::Engine.generate_salt
      self.pwd_encrypted_password = BCrypt::Engine.hash_secret(password, pwd_password_salt)
    end
  end
end
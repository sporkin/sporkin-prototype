class UserService
  class Providers
    FACEBOOK = "facebook"
    PASSWORD = "password"
  end

  class << self
    def create(options = {})
      identity = FacebookIdentity.new(options) if options[:provider] == UserService::Providers::FACEBOOK
      identity = PasswordIdentity.new(options) if options[:provider] == UserService::Providers::PASSWORD

      if identity
        user = User.new(:uuid => UUID.generate)
        user.identities << identity

        user.save
        user
      end
    end

    def find_user_by_pwd_email(email)
      Identity.find_by_pwd_email(email).user
    end

    def authenticate(options = {})
      if options[:provider] == UserService::Providers::PASSWORD
        if user = PasswordIdentity.authenticate!(options.slice(:email, :password))
          return Authentication.new(:status => "authenticated", :auth_key => user.id)
        else
          return Authentication.new(:status => "fail", :error => "invalid")
        end
      end

      if options[:provider] == UserService::Providers::FACEBOOK
        if user = FacebookIdentity.authenticate!(options.slice(:signed_request))
          return Authentication.new(:status => "authenticated", :auth_key => user.id)
        else
          return Authentication.new(:status => "fail", :error => "invalid")
        end
      end
    end
  end
end
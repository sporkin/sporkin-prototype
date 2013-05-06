class UserService
  class Providers
    FACEBOOK = "facebook"
  end

  class << self
    def create(options = {})
      if options[:provider] == UserService::Providers::FACEBOOK

        identity = FacebookIdentity.new(options)

        user = User.new(:uuid => UUID.generate)
        user.identities << identity

        user.save
        user
      end
    end
  end
end
class FacebookIdentity < Identity
  attr_accessible :signed_request, :fb_id
  attr_accessor :signed_request
  before_create :build_access_token, :build_identitiy_attributes

  class << self
    def authenticate!(options = {})
      signed_request = options[:signed_request]
      oauth = Koala::Facebook::OAuth.new(CONFIG["fb_app_id"], CONFIG["fb_app_secret"])
      auth_response = oauth.parse_signed_request(signed_request)
      fb_access_token = oauth.get_access_token(auth_response["code"])
      graph = Koala::Facebook::API.new(fb_access_token)
      profile = FacebookProfileParser.new(graph.get_object("me"))
      identity = FacebookIdentity.find_by_fb_id(profile.fbid) rescue nil
      return false unless identity
      return identity.user
    end
  end

  private
  def build_access_token
    oauth = Koala::Facebook::OAuth.new(CONFIG["fb_app_id"], CONFIG["fb_app_secret"])
    auth_response = oauth.parse_signed_request(signed_request)
    self.fb_access_token = oauth.get_access_token(auth_response["code"])
  end

  def build_identitiy_attributes
    graph = Koala::Facebook::API.new(fb_access_token)
    profile = FacebookProfileParser.new(graph.get_object("me"))
    self.fb_email = profile.email
    self.fb_id = profile.fbid
  end

  class FacebookProfileParser
    def initialize(attributes = {})
      @attributes = attributes
    end

    def fbid
      @attributes["id"]
    end
    
    def email
      @attributes["email"]
    end

    def first_name
      @attributes["first_name"]
    end
    
    def last_name
      @attributes["first_name"]      
    end
  end
end
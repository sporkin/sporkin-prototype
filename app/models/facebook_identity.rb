class FacebookIdentity < Identity
  attr_accessible :signed_request
  attr_accessor :signed_request
  before_create :build_access_token, :build_identitiy_attributes

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
  end

  class FacebookProfileParser
    def initialize(attributes = {})
      @attributes = attributes
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
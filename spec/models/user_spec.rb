require 'spec_helper'

describe User do
  include TestHelper::FacebookAPI
  describe ".create" do
    context "with facebook" do
      
      # let(:test_user) { fb_test_user }

      context "when new" do
        it "creates user and identity" do

          t = "BAAEwJ3Eiyu4BAKusSb7elnsRHB2WnYZCeldxiILisauu7gnZBvTGY79mV2q5osXXtbOb8zZCEcZAMyZBqHwtUtPLtSsXzyCAG4e55WUOgp25UU0k3PwqV7kIf5mRf07RjqY30X36sHgmrY2ZCUIEpyWOZAQJZCUY9IY1AvDxTtXd6ZBnaQge4G38zDvGRkscrIC10oTkg8RJkejbWzm8TWCWWpfZC7bkdvHtnKcQT1LY23HwZDZD"

          user = UserService.create(:provider => "facebook", :fb_access_token => t)
          
          
          
          # user = User.create(:provider => "facebook", :access_token => t)
          user.identities.first.fb_email.should == "zzurang@hotmail.com"
        end
      end

      context "when a user exists with the same email" do
        pending
      end
      
      
      context "test getting long-lived auth_token" do
        # t = "BAAEwJ3Eiyu4BABZCkzMfL6HhRlHv0EdUmz5ZC2eFy81sGNn3kQPZCqcf2B6UbeHM2TqQM57TngbQzG8QQUbFMrtRBBmmkPMgd3Er1jwicc2x8drCVLuu87ppwyxjCiTTcVDO1bTLOxXFetcVUdb4aBziqKdM7RJcXj6hwpXScznuFbG8NBBZBzZCvEKg0wkaMeTziqLsxNIOtPSvlUKzKpKZBiKiYt66T3EktHZAGZBJIQZDZD"
        
        
      end
    end
  end
end


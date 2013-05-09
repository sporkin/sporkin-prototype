require 'spec_helper'

describe User do
  include TestHelper::FacebookAPI
  describe ".create" do
    context "with facebook" do
      context "when new" do
        it "creates user and identity" do
          t = "token"
          user = UserService.create(:provider => "facebook", :fb_access_token => t)
          user.identities.first.fb_email.should == "zzurang@hotmail.com"
        end
      end

      context "when a user exists with the same email" do
        pending
      end

      context "test getting long-lived auth_token" do
        pending
      end
    end
  end
end


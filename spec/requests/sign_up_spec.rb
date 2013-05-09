require 'spec_helper'
describe "sign up" do
  describe "signup with facebook" do
    include TestHelper::FacebookAPI

    let(:fb_test_user_access_token) { fb_test_user["access_token"] }
    let(:fb_test_user_email) { fb_test_user["email"]}

    before(:each) do
      params = {
        :provider => UserService::Providers::FACEBOOK,
        :signed_request => "foo"
      }

      mock_auth = double("mock_auth", {:parse_signed_request => double("foo").as_null_object, :get_access_token => fb_test_user_access_token})
      Koala::Facebook::OAuth.stub(:new).and_return(mock_auth)
      post "/users.json", params
    end

    it "creates user entity" do
      result = {
        :uuid => User.last.uuid
      }

      User.last.identities.last.fb_email.should == fb_test_user_email
    end
  end

  describe "sign up with email/password" do
    before(:each) do
      params = {
        :provider => UserService::Providers::PASSWORD,
        :email => "foo@bar.com",
        :password => "foobar1212!",
        :password_confirmation => "foobar1212!"
      }

      post "/users.json", params
    end

    it "creates user entity with password identity" do
      User.last.identities.last.email.should == "foo@bar.com"
    end
  end
end

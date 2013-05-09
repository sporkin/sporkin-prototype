require 'spec_helper'
describe "sign in" do
  describe "sign in with email/password" do
    before(:each) do
      params = {
        :provider => UserService::Providers::PASSWORD,
        :email => "foo@bar.com",
        :password => "foobar1212!",
        :password_confirmation => "foobar1212!"
      }

      post "/users", params
    end

    context "with correct email/password" do
      before(:each) do
        post "/login", {:email => "foo@bar.com", :password => "foobar1212!", :provider => UserService::Providers::PASSWORD}
      end

      it "sets session cookie" do
        session[:id].should be_true
      end

      it "returns 200" do
        response.status.should == 200
      end
    end

    context "with incorrect email/password" do
      pending
    end
  end

  describe "sign in with email/password" do
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

    context "with valid signed_request" do
      before(:each) do
        post "/login", {:signed_request => "foo", :provider => UserService::Providers::FACEBOOK}
      end

      it "sets session cookie" do
        session[:id].should be_true
      end

      it "returns 200" do
        response.status.should == 200
      end
    end
  end
end


class Identity < ActiveRecord::Base
  attr_accessible :fb_access_token, :fb_email, :fb_first_name, :fb_id, :fb_last_name, :fb_url, :provider, :user_id, :type
  belongs_to :user, :foreign_key => :user_id
end

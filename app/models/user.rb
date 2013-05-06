class User < ActiveRecord::Base
  attr_accessible :uuid
  has_many :identities
end

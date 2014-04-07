class User < ActiveRecord::Base
  has_secure_password

  has_many :bookmarks
  has_many :comments

end

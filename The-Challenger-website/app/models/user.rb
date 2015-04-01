class User < ActiveRecord::Base
	has_many :challenges, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :Likes, :dependent => :destroy

end

class Comment < ActiveRecord::Base
	belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "challenge_id"
	belongs_to :User, :class_name => "User", :foreign_key => "user_id"

end

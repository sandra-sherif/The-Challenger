class ChallengeResponse < ActiveRecord::Base
	belongs_to :User, :class_name => "User", :foreign_key => "user_id"
	belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "Challenge_id"


end

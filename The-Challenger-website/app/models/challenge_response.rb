class ChallengeResponse < ActiveRecord::Base
<<<<<<< HEAD
	belongs_to :User, :class_name => "User", :foreign_key => "user_id"
	belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "Challenge_id"
	has_many :tags

=======
	belongs_to :user, :class_name => "User", :foreign_key => "user_id"
	belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "Challenge_id"
	
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3
end

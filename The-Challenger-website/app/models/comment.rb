class Comment < ActiveRecord::Base
	belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "Challenge_id"
	belongs_to :User, :class_name => "User", :foreign_key => "User_id"

end

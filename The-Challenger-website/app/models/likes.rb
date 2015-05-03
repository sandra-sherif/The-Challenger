class Likes < ActiveRecord::Base
	
	belongs_to :user, :class_name => "User", :foreign_key => "user_id"
	belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "path"
	validates :path, presence: true
	validates :user_id, presence: true
	
end

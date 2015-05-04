class Block < ActiveRecord::Base

	belongs_to :user1, :class_name => "User", :foreign_key => "blocked_by"
	belongs_to :user2, :class_name => "User", :foreign_key => "blocked"
	validates :blocked_by, presence: true
	validates :blocked, presence: true
	
end

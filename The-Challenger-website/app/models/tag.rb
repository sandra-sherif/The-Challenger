class Tag < ActiveRecord::Base
    belongs_to :Challenge
    belongs_to :user1, :class_name => "User", :foreign_key => "tagged"
	belongs_to :user2, :class_name => "User", :foreign_key => "tagged_by"
    validates :tagged, presence: true
	validates :tagged_by, presence: true
	
end

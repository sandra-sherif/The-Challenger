class Friends < ActiveRecord::Base
	
	belongs_to :user1, :class_name => "User", :foreign_key => "sent_to"
	belongs_to :user2, :class_name => "User", :foreign_key => "sent_by"
	validates :sent_to, presence: true
	validates :sent_by, presence: true
	validates :status, presence: true

end
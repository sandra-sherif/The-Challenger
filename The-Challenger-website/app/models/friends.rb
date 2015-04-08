class Friends < ActiveRecord::Base
	
	belongs_to :user1, :class_name => "User", :foreign_key => "Sender"
	belongs_to :user2, :class_name => "User", :foreign_key => "Receiver"

end

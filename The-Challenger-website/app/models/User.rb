class User <ActiveRecord::Base
	attr_accessible :email , :password, :confirm_password, :first_name, :last_name, :user_name
has_many :addfriends
has_many :friends, through: Addfriend

def full_name
	first_name + " " + last_name
	
end
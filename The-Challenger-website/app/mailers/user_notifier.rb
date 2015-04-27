# authored by: Seif Meligy

class UserNotifier < ApplicationMailer
    
  default :from => 'from@thechallenger.com'
  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for The Challenger. We hope you enjoy yourself challenging others.' )
  end
  
  # friend requested email an email to the friend by the user who asks to add the other user
  def friend_requested (user)
	@user = sent_by.friends
	@friend = sent_to.friends
	mail( :to => @friend.email,
	:subject => ' #{@user.full_name} want to be your friend ' )
	end

 # friend requested accepted sends an email to the user who sent the email to the 
def friend_requested_accepted (user)

	@user = sent_by.friends
	@friend = sent_to.friend

	mail( :to => @friend.email,
	:subject =>  "#{@user.full_name} has accepted your friend request" )
end

def report_sent(user)
    @user = user 
    mail( :to => @user.email, 
    :subject => 'Your video has been reported')
end
def deleted_video(user)
    @user = user
    mail( :to => @user.email, 
    :subject => 'Your video has been deleted')
end
end

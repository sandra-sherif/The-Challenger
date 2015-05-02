require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do

	it "redirects to view all challenges" do 
		user = User.create!(:email => "marina@gmail.com", :password => "12345678", :id  => 5)
		sign_in(user)
		
		get :index, user1_id: user.id
		expect(response).to render_template("index")
	end 

	it "redirects to new challenge" do 
		user = User.create!(:email => "marina@gmail.com", :password => "12345678", :id  => 5)
		sign_in(user)
		
		get :new, user1_id: user.id
		expect(response).to render_template("new")
	end 

end

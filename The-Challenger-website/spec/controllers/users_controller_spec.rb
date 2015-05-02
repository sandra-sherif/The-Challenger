require 'rails_helper'
require 'spec_helper'
include Devise::TestHelpers
# include Devise::ControllerHelpers

RSpec.describe UsersController, type: :controller do

	it "redirects to the user profile" do 
		user = User.create!(:email => "marina@gmail.com", :password => "12345678", :id  => 5)
		sign_in(user)
		user2 = User.create!(:email => "marina2@gmail.com", :password => "12345678", :id  => 6)
		
	get :show, id: user2.id
	# expect(assigns(:users)).to eq([user2])
	expect(response).to render_template("show")
end 
end


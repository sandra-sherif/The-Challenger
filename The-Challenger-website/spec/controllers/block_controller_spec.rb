require 'rails_helper'
require 'spec_helper'
include Devise::TestHelpers

RSpec.describe BlockController, type: :controller do

	before(:each) do
		@user = User.create(email: "marmar@guc.com", password: "12345678")
		@user2 = User.create(email: "za3bola@guc.com", password: "12345678")
		sign_in(@user)
		@block = Block.create! :blocked_by => @user.id, :blocked => @user2.id 
	end


	describe 'GET #new' do
  		it 'assigns a new block to @block' do
    	get :new
    	expect(assigns(:block)).to be_a_new(Block)
		end
	end

	describe "create_block" do

		it 'assigns blocked by and blocked' do
			sign_in(@user)
			# get :create_block
			@block = Block.create! :blocked_by => @user.id, :blocked => @user2.id 
			# expect(response).to render_template("users#show")
		end
	end 

	# describe "#destroy" do

	# 	it 'finds block by blocked by and blocked ids' do

	# 		get :destroy
	# 		expect(response).to redirect_to(user_path)

	# 	end

	# 	it 'redirects to user_path' do
	# 	end


	end

end

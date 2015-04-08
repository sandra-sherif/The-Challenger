# require 'factory_girl_rails'
require 'spec_helper'
require 'rails_helper'


describe User, type: :model do 
	 it "is valid without a first_name, last_name, age, avatar" do
	 	user = User.new(email: "marinaeldib@hotmail.com", password:"12345678")
	 expect(user).to be_valid
	 end

	 it "is invalid without an email" do
	 	user = User.new(first_name: "Marina", last_name:"ElDib", password:"12345678")
	 	expect(user).to be_invalid
	 end

	 it "returns a user's full_name as a string" do
	 	user = User.new(email: "marinaeldib@gmail.com", password: "12345678", first_name: "Marina", 
	 		last_name: "ElDib")
	 	expect(user.full_name).to eq("Marina ElDib")
	end
	
	 it "is invalid with age not integer" do
	 	user = User.new(email: "marinaeldib@gmail.com", password: "12345678", first_name: "Marina", 
	  		last_name: "ElDib", age: "m")
	 	expect(user).to be_invalid
	 end

	  it "is invalid with age greater than 99" do
	 	user = User.new(email: "marinaeldib@gmail.com", password: "12345678", first_name: "Marina", 
	  		last_name: "ElDib", age: "189")
	 	expect(user).to be_invalid
	 end
	 # it "uploads avatar" do
	 # 	user = User.new(email: "marinaeldib@hotmail.com", password:"12345678", avatar_file_name: "marina.jpeg",
	 # 		avatar_content_type: "image/jpeg", avatar_file_size: 12345)
	 # 	expect(user).to be valid
	 # end

	 # context "avatar upload" do
  #    	let(:avatar) {Rack::Test::UploadedFile.new(avatar_content_type,'image/jpg')}
  #    	it "uploads avarar" do
  #       post :update, :user => {:avatar => avatar}
  #     end

#   it "should upload the file correctly" do
#   	expect(@user).to recieve(:update_attributes).and_return(true)
#   # @user.should_receive(:update_attributes).and_return(true)
#   do_upload_asset
# end

    
end
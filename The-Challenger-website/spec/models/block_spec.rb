require 'rails_helper'

RSpec.describe Block, type: :model do
  
  it "is invalid without blocked_by" do
	 	user = User.create!(email: "marinaeldib@gmail.com", password: "12345678", first_name: "Marina", 
	  		last_name: "ElDib")
	 	user2 = User.create!(email: "marina@gmail.com", password:"12345678")
	 	block = Block.new(blocked: user.id)
	 	expect(block).to be_invalid
	 end

  it "is invalid without blocked" do
	 	user = User.create!(email: "marinaeldib@gmail.com", password: "12345678", first_name: "Marina", 
	  		last_name: "ElDib")
	 	user2 = User.create!(email: "marina@gmail.com", password:"12345678")
	 	block = Block.new(blocked_by: user.id)
	 	expect(block).to be_invalid
	 end

  it "is valid" do
	 	user = User.create!(email: "marinaeldib@gmail.com", password: "12345678")
	 	user2 = User.create!(email: "marina@gmail.com", password:"12345678")
	 	block = Block.new(blocked_by: user.id, blocked: user2.id)
	 	expect(block).to be_valid
	 end



end

# spec/models/comment.rb
require 'spec_helper'
require 'rails_helper'

Rspec.describe Comment, type: :model do
	it "has a valid factory" do
    Factory.create(:comment).should be_valid
  end
	it "is invalid if empty"
	it "is created by user"
	it "belongs to a challenge"
end


# require 'rails_helper' RSpec.describe CategoriesController, type: :controller 
# do let(:user)
#o user = User.new user.email = "maryam@gmail.com" user.encrypted_password = "1234" user.save validate: false user 
#end describe "GET index"
#do it "assigns @categories"
#do category = Category.create!(:name => 'Education' ) get :index expect(assigns(:categories )).to eq([category]) 
#end 
#it "renders the index template" 
#do get :index expect(response).to render_template("index") 
#end 
#end describe "GET show" 
#do it "renders the #show view" 
#do category = Category.create!(:name => 'Education' ) get :show, id: category.id expect(response).to render_template("show") 
#end 
#end describe "GET new" 
#do it 'assigns a new category to @category' 
#do get :new expect(assigns(:category)).to be_a_new(Category) 
#end 
#end it "should create category" 
#do user sign_in(user) post :create, category: { :name => "Education", } expect(Category.exists?(name: "Education")).to eq(true) 
#end it "deletes the category" 
#do category = Category.create!(:name => 'Education' ) expect{ delete :destroy, id: category.id }.to change(Category,:count).by(-1) 
#end 
#end
#wa da model bl validations
#require 'rails_helper' require 'spec_helper' 
#RSpec.describe Notification, type: :model do 
#	it "is valid with a appname , desription and price" 
#	do application = Application.new( appname: 'Viber', description: 'Good', price: 11 ) expect(application).to be_valid 
#	end 
#	it "is invalid without a Appname" 
#		do application = Application.new(appname: nil ,description: 'Good' ,price: 11) application.valid? expect(application.errors[:appname]).to include("can't be blank") 
#		end 
#		it "is invalid without a Description" 
#			do application = Application.new(appname:'Viber' ,description: nil ,price: 11) application.valid? expect(application.errors[:description]).to include("can't be blank") 
#			end 
#			it "is invalid without a Price" 
#				do application = Application.new(appname: 'Viber' ,description: 'Good' ,price: nil) application.valid? expect(application.errors[:price]).to include("can't be blank") 
#				end 
#				it "is invalid without an Numerical Price" 
#					do application = Application.new(appname: 'Viber' ,description: 'Good' ,price: 'abc') application.valid? expect(application.errors[:price]).to include("is not a number") 
#					end 
#				end
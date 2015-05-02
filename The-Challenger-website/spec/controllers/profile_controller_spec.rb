require 'rails_helper'
require 'spec_helper'
include Devise::TestHelpers

RSpec.describe ProfileController, type: :controller do

	let(:user) do
    user = User.new
    user.email = "marina@gmail.com"
    user.encrypted_password = "12345678"
    user.save validate: false
    user
	end


it "renders the #show view" do
user
sign_in(user)
get :show
expect(response).to render_template("show")
# expect(assigns(:user)).to eq([user])
end

end

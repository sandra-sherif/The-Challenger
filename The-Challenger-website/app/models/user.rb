class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
# def full_name
#     if self.first_name.blank? && self.last_name.blank?
#       self.email
#     else
#       self.first_name + " " + self.last_name
#     end
#   end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

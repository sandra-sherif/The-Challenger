class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
<<<<<<< HEAD
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :challenges, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :Likes, :dependent => :destroy
=======
 # :confirmable, :lockable, :timeoutable and :omniauthable
def full_name
    if self.first_name.blank? && self.last_name.blank?
      self.email
    else
      self.first_name << " " << self.last_name
    end
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :challenges, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :Likes, :dependent => :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
>>>>>>> 54d0329f768ec500c21ed1302fd475e76c66a5b3

end

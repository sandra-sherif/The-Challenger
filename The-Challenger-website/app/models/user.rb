class User < ActiveRecord::Base

# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthabl

#This method gets the user's full name to be used later in the views
  def full_name
    if self.first_name.blank? && self.last_name.blank?
       self.email
    else
       self.first_name + " " + self.last_name
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :challenges, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :Likes, :dependent => :destroy
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :age, :numericality => {:only_integer => true}, :allow_nil => true,
  :length => {:maximum => 2}
  # validates :age, :numericality => {:must_be_less_than_or_equal_to => 100}

end
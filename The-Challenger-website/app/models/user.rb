class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
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
  has_many :user_friendships
has_many :friends, through: :Addfriend, conditions: user_friendships: {state: 'accepted'}
has_many :pending_user_friendships , class_name: 'Addfriend', foreign_key: :user_id, conditions: {state: 'pending'}
has_many :pending_user_friendships , through :pending_user_friendships, source: :friends

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "missing.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end

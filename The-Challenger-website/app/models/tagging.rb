class Tag < ActiveRecord::
   attr_accessible :name, :upload_tpye, :path, :tags_attributes
   belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "challenge_id"
   belongs_to :Challenge_response, :class_name => "Challenge", :foreign_key => "challenge_id"
  	belongs_to :User, :class_name => "User", :foreign_key => "user_id"
  attr_accessible :name
  has_many :taggings
  has_many :taggings, through: :taggings
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end

class challenge < ActiveRecord::Base # class upload video/image
  attr_accessible :name, :upload_tpye, :path, :tags_attributes
 
  validates :name,  :presence => true
  validates :upload_tpye, :presence => true
                   # :length => { :minimum => 5 }
 validates :path :presence => true
  has_many :comments, :dependent => :destroy
  has_many :tags
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end


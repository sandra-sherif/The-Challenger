=begin
array and access it bel index where index = id 
walla 
hashtable and access it 3ala toul bel index
acessing hashvalue ca be with ids 
bsp
pets["marianne"] output sister
pets: hashtable name
marianne: hashkey whci would be the id in our case

=end

# s
#lass TweetsController < ApplicationController
  #def index
    #Get the tweets (records) from the model Ordered by 'twitter_created_at' descending

  # searchValue = params[:keyword] 

 #if Tweet.count > 0                         
     #          Tweet.delete_all        
    #end    
   #  Tweet.get_latest_new_year_resolution_tweets("iphone")

  #  @tweets = Tweet.order("twitter_created_at desc")   


 # end

#end



# my code
 #function tagging() {
    #var x= document.getElementById("myText").value;
    #if (x == null || x== ""){
     # alert ("No one is tagged in this post."); //+ y);
    
    #} else {
   # alert("Person tagged: "+ x);


  # def tagging (*names) #dont know if it takes params yet 
 #	user_input = Get.names_id 

 #	hashtable.select { |k, v| k == :id} # select from array where key from hash = id of image
# THERE IS a method called .each_Key FOR keys and each_value for values only
#def get_id () # id of image
#	@id # photo/ video id
#end


#class tagFriend 
#def tagging (* names)
#	hashtable= Hash.new 
#	if array.contains(names)
	#array.push(names}
#		render tagged



# to add names in hashtable
	#	def add(*names)
	#		names.each do  | photo_id, user_name|
	#		hashtable[photo_id,user_name]
	#	end




# the model for post
# class Tag < ActiveRecord::Base
#   attr_accessible :content, :name, :title
# validates :name,  :presence => true
       
# end

# t = Tag.new(:content => "Tag a Person")
# => #<Tag id: nil, name: nil, title: nil,
#      content: "Tag a Person", created_at: nil,
#      updated_at: nil>
# >> t.save
# => false
# >> t.errors.full_messages
# => ["Name can't be blank"]

# # in Contorller 
# def tagging
#   @tags = Tag.all
 
#   respond_to do |format|
#     format.html  # index.html.erb
#     format.json  { render :json => @tags }
#   end
# end

# def create
#   @tags = Tag.new(params[:tag])
 
#   respond_to do |format|
#     if @tags.save
#       format.html  { redirect_to(@tags,
#                     :notice => 'Person was successfully tagged.') }
#       format.json  { render :json => @tags,
#                     :status => :created, :location => @tags }
#     else
#       format.html  { render :action => "new" }
#       format.json  { render :json => @tags.errors,
#                     :status => :unprocessable_entity }
#     end
#   end
# end

# def show
#   @tags = Tag.find(params[:id])
 
#   respond_to do |format|
#     format.html  # show.html.erb
#     format.json  { render :json => @tags }
#   end
# end

# def deleteTag
#   @tags = Tag.find(params[:id])
#   @tags.deleteTag
 
#   respond_to do |format|
#     format.html { redirect_to tag_url }
#     format.json { head :no_content }
#   end
# end

# all of the above was for post beispiel

# fi le comment bas mesh 3arfa a3melu walla asib da 



# for comment
=begin
class Tag < ActiveRecord::Base
  belongs_to :post #upload video
end

#for model
class CreateTag < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :chanllenger
      t.text :body
      t.references :post # upload video
 
      t.timestamps
    end
 
    add_index :tags, :post_id # video_id
  end
end

# in upload video 
=begin
class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title
 
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :comments has_many should be :tags
end
=end

# class TagContoller < ApplicationController
 
 # =begin
 # def create
 #    @post = Tag.find(params[:post_id]) #video_id
 #    @tags = @post.tag.create(params[:tag])
 #    redirect_to post_path(@post)
 #  end
 
 #  def delete
 #    @post = Tag.find(params[:post_id]) #video_id
 #    @tags = @post.tags.find(params[:id])
 #    @tags.delete
 #    redirect_to post_path(@post)
 #  end
  # =end

 
# end

# if a video got deleted then tagged need tol be removed otherwise they would take places in database

=begin
class Post < ActiveRecord::Base # class video
  attr_accessible :content, :name, :title
 
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  has_many :tags, :dependent => :delete
end
=end



class Post < ActiveRecord::Base # class upload video/image
  attr_accessible :content, :name, :title, :tags_attributes
 
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :comments, :dependent => :destroy
  has_many :tags
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end


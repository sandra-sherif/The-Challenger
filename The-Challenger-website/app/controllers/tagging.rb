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
lass TweetsController < ApplicationController
  def index
    #Get the tweets (records) from the model Ordered by 'twitter_created_at' descending

   searchValue = params[:keyword] 

 if Tweet.count > 0                         
               Tweet.delete_all        
    end    
     Tweet.get_latest_new_year_resolution_tweets("iphone")

    @tweets = Tweet.order("twitter_created_at desc")   


  end

end



# my code
 function tagging() {
    var x= document.getElementById("myText").value;
    if (x == null || x== ""){
      alert ("No one is tagged in this post."); //+ y);
    
    } else {
    alert("Person tagged: "+ x);


   def tagging (*names) #dont know if it takes params yet 
 	user_input = 
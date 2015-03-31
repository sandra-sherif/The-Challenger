module UsersHelper
	#Gravatar
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.last_name, class:"gravatar")
	end
end

class Notification < ActiveRecord::Base
	validates :sent_to, presence: true
	validates :sent_by, presence: true
	validates :text, presence: true
	validates :notification_type, presence: true

end

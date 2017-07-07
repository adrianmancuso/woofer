class PrivateMessage < ActiveRecord::Base
	
	validates :body, presence: true

	def empty_message_error
		errors.add(:body, "Private messages cannot be empty!")
	end
	
end
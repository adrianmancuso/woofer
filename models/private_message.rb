class PrivateMessage < ActiveRecord::Base
	
	validates :body, presence: true

	def error_message
		errors.add(:body, "cannot be empty!")
	end

end
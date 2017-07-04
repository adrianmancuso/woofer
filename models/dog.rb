class Dog < ActiveRecord::Base
	has_secure_password
	has_many :personal_messages
end


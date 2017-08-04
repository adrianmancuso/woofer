require 'active_record'

options = {
	adapter: 'postgresql',
	database: 'woofer',
	username: 'mancuso'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options )
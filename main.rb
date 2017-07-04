     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

require_relative 'db_config'
require_relative 'models/dog'
require_relative 'models/leash'
require_relative 'models/breed'
require_relative 'models/location'
require_relative 'models/private_message'

def run_sql(sql)
	conn = PG.connect(dbname: 'woofer')
	result = conn.exec(sql)
	conn.close
	result
end

helpers do

	def logged_in?
		current_user ? true :false
	end

	def current_user
		User.find_by(id: session[:user_id])
	end
end


enable :sessions

get '/' do
  erb :index
end

get '/sign-up' do
	erb :sign_up
end

post '/sign-up' do
	@new_user = Dog.create(user_name: params[:user_name], image_url: params[:image_url], age: params[:age], bio: params[:bio], password: params[:password])
	binding.pry
	redirect '/'
end


get '/login' do 
	erb :login
end

post '/session' do
	user = Dog.find_by(user_name: params[:user_name])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		erb :login
	end
end

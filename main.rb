     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require 'httparty'

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
		current_user ? true : false
	end

	def current_user
		Dog.find_by(id: session[:user_id])
	end

end


enable :sessions

get '/' do
	@dogs = Dog.all
  erb :index
end

get '/sign-up' do
	@dogs = Dog.all
	erb :sign_up
end

post '/sign-up' do
	@geo_loc = get_location(params[:address])
	coordinates = @geo_loc["lat"],@geo_loc["lng"]
	@new_user = Dog.create(user_name: params[:user_name], image_url: params[:image_url], age: params[:age], bio: params[:bio], address: params[:address], geo_location: coordinates, password: params[:password])
	session.clear
	redirect '/login'
end


get '/login' do 
	@dogs = Dog.all
	erb :login
end

get '/logout' do
	session.clear
	redirect "/"
end

get '/edit' do
	@dogs = Dog.all
	erb :edit
end

patch '/dogs/:id' do 
	@dog = Dog.find(current_user.id)
	@dog.image_url = params[:image_url]
	@dog.age = params[:age]
	@dog.bio = params[:bio]
	@dog.save
	redirect '/'
end

post '/session' do
	@dogs = Dog.all
	user = Dog.find_by(user_name: params[:user_name])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		erb :login
	end
end

get '/dogs/:id' do 
	@dog = Dog.find(params[:id])
	@dogs = Dog.all
	erb :dog_profile
end

post '/dogs/:id' do 
	@dogs = Dog.all
	@dog = Dog.find(params[:id])
	@new_message = PrivateMessage.create(body: params[:body], recipient_id: params[:recipient_id], sender_id: current_user.id)
	erb :dog_profile
end

def get_location(address)
	api_call = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=AIzaSyDSomp9bEPfP3XI-GrdNnyzaTolK6YLpcY")
	api_call["results"][0]["geometry"]["location"]
end
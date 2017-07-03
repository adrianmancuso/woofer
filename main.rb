     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

require_relative 'db_config'
require_relative 'models/dog'

def run_sql(sql)
	conn = PG.connect(dbname: 'woofer')
	result = conn.exec(sql)
	conn.close
	result
end

enable :sessions

get '/' do
  erb :index
end

get '/login' do 
	erb :login
end



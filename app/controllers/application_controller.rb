require "./config/environment"
require "./app/models/pin"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    erb :index
  end
  
  get '/post' do 
    erb :makepin
  end
  
  post '/makepin' do
    
    @pin = Pin.new(params[:user], params[:image], params[:link], params[:description], params[:category])
    @pins = Pin.all
    erb :index
    
  end
 
end
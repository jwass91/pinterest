require "./config/environment"
require "./app/models/pin"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    @pins = Pin.all
    erb :index
  end
  
  get '/post' do 
    erb :makepin
  end
  
  post '/makepin' do
    
    @pin = Pin.new(:user => params[:user],:image =>  params[:image],:link =>  params[:link],:description =>  params[:description],:category =>  params[:category])
    @pins = Pin.all
    redirect '/'
#     erb :index
    
  end
 
end
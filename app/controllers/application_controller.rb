require "./config/environment"
require "./app/models/pin"
require "./app/models/user"

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
    @user = User.find_by(:username => params[:user])
    @pin = Pin.new(:user_id => @user.id,:image => params[:image],:link => params[:link],:description =>  params[:description],:category => params[:category])
#     @pins = Pin.all
    @pin.save
    redirect '/'
#     erb :index 
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @user = User.new(:username => params[:user], :fullname => params[:name], :email => params[:email])
    @user.save
    redirect '/'
  end
 
end
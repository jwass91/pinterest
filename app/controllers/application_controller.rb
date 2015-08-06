require "./config/environment"
require "./app/models/pin"
require "./app/models/user"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, 'usernmae'
  end
  
  get '/' do
    @pins = Pin.all
    erb :index
  end
  
  get '/post' do
    if session[:user_id] == nil
      redirect '/'
    else
      erb :makepin
    end
    
  end
  
  post '/makepin' do
#     @user = User.find_by(:username => params[:user])
    @pin = Pin.new(:user_id => session[:user_id],:image => params[:image],:link => params[:link],:description =>  params[:description],:category => params[:category])
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
 
  get '/login' do
    erb :login
  end
  
  post '/login' do
    @user = User.find_by(:username => params[:user])
    
    if @user == nil
      redirect '/login'
    else
      session[:user_id] = @user.id
      redirect '/'
    end
  end
  
  
  get '/logout' do
    session.clear
    redirect '/login'
  end
  
  
  
end
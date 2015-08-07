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
  
#---------------------------------------------------------------------------------
  
  #Homepage loading starts here
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
  #end of homepage methods
  
#---------------------------------------------------------------------------------
  
  #Creation of pins page
  post '/makepin' do
#     @user = User.find_by(:username => params[:user])
    @pin = Pin.new(:user_id => session[:user_id],:image => params[:image],:link => params[:link],:description =>  params[:description],:category => params[:category])
#     @pins = Pin.all
    @pin.save
    redirect '/'
#     erb :index 
  end
  #end of pin creation
  
#---------------------------------------------------------------------------------
  
  #Signup page
  get '/signup' do
    erb :signup
  end
  
  post '/signup' do
    @user = User.new(:username => params[:user], :fullname => params[:name], :email => params[:email])
    @user.save
    redirect '/'
  end
  #end of signup page
  
#---------------------------------------------------------------------------------
  
  #Login page methods
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
  #end of login page
  
#---------------------------------------------------------------------------------
  
  #basic logout command
  get '/logout' do
    session.clear
    redirect '/login'
  end
  #end of logout command
  
  
end
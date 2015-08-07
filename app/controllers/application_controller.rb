require "./config/environment"
require "./app/models/pin"
require "./app/models/user"
require "./app/models/email"

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
    @error2 = ""
    @api_string = (0...32).map{65.+(rand(25)).chr}.join
    @user = User.new(:username => params[:user], :fullname => params[:name], :email => params[:email], :verified => @api_string)
    @user.password = params[:password]
    if @user.valid?
      Email.send_simple_message(params[:email], params[:user], @api_string)
    @user.save
    session[:user_id] = @user.id
    redirect '/'
    else
      @error2 = "Username and/or email is taken. Please try another one."
      erb :signup
    end
  end
  #end of signup page
  
#---------------------------------------------------------------------------------
  
  #Login page methods
  get '/login' do
    erb :login
  end
  
  post '/login' do
     @error = ""
    @user = User.find_by(:username => params[:user])
    
    if params[:user] == "" || params[:password] == ""
      @error = "Please fill out all the fields"
        erb :login
    elsif @user == nil || @user.password != params[:password]
      @error = "Incorrect password or username"
        erb :login
    elsif @user.password == params[:password]
      session[:user_id] = @user.id
      session[:verified] = @user.verified
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
  
#---------------------------------------------------------------------------------
  
  #verification command link
  get '/verify/:code' do
    puts params[:code]
    @user = User.find_by(:verified => params[:code])
#     puts @user
#     puts params[:code]
    @user.verified=""
    @user.save
    redirect '/'
  end
  
  
#---------------------------------------------------------------------------------
  
  get '/:username' do
    @user = User.find_by(:username => params[:username])
    if @user == nil
      redirect '/'
    else
      @pins = []
      Pin.where(user_id: @user.id).find_each do |t|
        @pins.push(t)
      end
    end
    erb :user
  end
  
  
end
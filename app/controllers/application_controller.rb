require "./config/environment"
require "./app/models/pin"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do

  end
  
  post '/makepin' do
    
    @user = params[:user]
    @image = params[:image]
    @link = params[:link]
    @description = params[:description]
    @category = params[:category]
    
    erb :makepin
    
  end
 
end
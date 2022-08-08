require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/chit'
require './lib/user'
require './lib/session'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @chits = Chit.all
    erb :index
  end

  get '/post_chit' do
    @chits = Chit.all
    @message = $user
    erb :post_chit
  end

  post '/post_chit' do
    Chit.post(handle: params[:handle], content: params[:chit])
    redirect '/post_chit'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.sign_up(full_name: params[:full_name], username: params[:username], handle: params[:handle], email: params[:email], password: params[:password])
    redirect '/sign_up_confirmation'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = Session.find_user(handle: params[:handle], password: params[:password])
    session[:user] = user
    session[:message] = "testing, testing"
    user = session[:user]
    $user = user.handle
    if user 
      redirect './post_chit'
    else
      redirect './'
    end

  end


  get '/sign_up_confirmation' do
    erb :sign_up_confirmation
  end

  run! if app_file == $0
end

class UserController < ApplicationController

  get '/signup' do
    erb :"users/create_user"
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect "/"
  end

  # get '/logout' do
  #   erb :"users/"
  # end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(params)
      session[:user_id] = @user.id
    redirect '/tweets'
    else
    redirect "/signup"
    end
  end

end
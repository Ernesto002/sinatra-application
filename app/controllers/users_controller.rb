class UsersController < ApplicationController

  get "/signup" do
    redirect "/users/#{session[:user_id]}" if session[:user_id]
    erb :"/users/new.html"
  end

  get "/login" do
    redirect "/users/#{session[:user_id]}" if session[:user_id]
    erb :"/users/login.html"
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    redirect "/signup" unless user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  end

  post "/logout" do 
    session.destroy
    redirect "/"
  end

  # shows all reviews by user
  get "users/:id" do 
    @user = User.find_by(id: params[:id]) 
    erb :"/users/show.html"
  end

  # create new user
  post "/signup" do 
    redirect "/signup" if params.values.any? { |p| p.empty? } || 
    User.find_by(username: params[:username]) || 
    User.find_by(email: params[:email]) 
    # find way to post password better
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect "/login" 
  end

end

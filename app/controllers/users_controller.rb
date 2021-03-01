class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/new.html"
  end

  get "/login" do
    erb :"/users/login.html"
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    redirect "/signup" unless user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/:id"
  end

  post "/logout" do 
    #session.destroy
    redirect "/"
  end

  # shows all reviews by user
  get "users/:id" do 
    erb :"/users/show.html"
  end

  # create new user
  post "users/new" do 
    # create new user from params
    # send validation
    redirect "/login" 
  end

end

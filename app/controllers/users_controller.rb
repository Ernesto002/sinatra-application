class UsersController < ApplicationController

  get "/signup" do
    redirect "/users/#{current_user.id}" if logged_in?
    @error = params[:error]
    erb :"/users/new.html"
  end

  get "/login" do
    redirect "/users/#{session[:user_id]}" if session[:user_id]
    @error = params[:error]
    erb :"/users/login.html"
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    end
    redirect "/signup?error=Invalid for submission, please try again:"
  end

  post "/logout" do 
    session.destroy
    redirect :/
  end

  get "users/:id" do 
    @user = User.find_by(id: params[:id])
    redirect back unless @user 
    show_ids = @user.reviews.map { |review| review[:movie_id] }
    @shows = Show.all.select { |show| show_ids.include?(show.id) }
    erb :"/users/show.html"
  end

  # create new user
  post "/signup" do 
    if params.values.any?(&:empty?) || User.find_by(username: params[:username]) || User.find_by(email: params[:email]) 
      redirect "/signup?error=Invalid for submission, please try again:"
    end
    # find way to post password better
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect :login
  end

end

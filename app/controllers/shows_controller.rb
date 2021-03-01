class ShowsController < ApplicationController

  get "/shows/new" do
    erb :"/shows/new.html"
  end

  post "/shows" do 
    # create show
    # redirect "/shows/{show.id}"
    redirect "/"
  end

  get "/shows/:id" do 
    # get reviews for show 
    @show = Show.find_by(id: params[:id])
    # redirect "/shows/new" unless @show
    erb :"/shows/show.html"
  end
end

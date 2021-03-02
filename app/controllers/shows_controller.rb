class ShowsController < ApplicationController

  get "/shows/new" do
    erb :"/shows/new.html"
  end

  post "/shows" do
    redirect "/shows/new" if params.values.any?(&:empty?) || Show.find_by(name: params[:name])
    show = Show.create(name: params[:name])
    redirect "/shows/#{show.id}"
  end

  get "/shows/:id" do 
    # get reviews for show 
    @show = Show.find_by(id: params[:id])
    redirect :"shows/new" unless @show
    erb :"/shows/show.html"
  end

  get "/shows" do 
    @shows = Show.all
    erb :"/shows/index.html"
  end
end

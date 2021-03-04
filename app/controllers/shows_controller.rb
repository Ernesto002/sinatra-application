class MoviesController < ApplicationController
  get '/shows/new' do
    @error = params[:error]
    erb :'/shows/new.html'
  end

  post '/shows' do
    redirect '/shows/new?error=Invalid form submission, please try again:' if params.values.any?(&:empty?) || Show.find_by(name: params[:name])
    show = Show.create(name: params[:name])
    redirect "/shows/#{show.id}"
  end

  get '/shows/:id' do
    @show = Show.find_by(id: params[:id])
    redirect :'shows/new' unless @show
    @error = params[:error]
    user_ids = @show.reviews.map { |review| review[:user_id] }
    @users = User.all.select { |user| user_ids.include?(user.id) }
    erb :'/shows/show.html'
  end

  get '/shows' do
    @shows = Show.all
    erb :'/shows/index.html'
  end
end
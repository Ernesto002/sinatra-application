class ReviewsController < ApplicationController

  # POST: /reviews
  post "/reviews" do
    show = Show.find_by(id: params[:show_id])
    identical = !!show.reviews.detect { |review| review.content == params[:content] && review.user_id == session[:user_id]}
    redirect "/shows/#{params[:show_id]}" if params.values.any?(&:empty?) || identical

    review = Review.create(content: params[:content], rating: params[:rating], show_id: params[:show_id], user_id: session[:user_id])
    redirect "/shows/#{review.show_id}"
  end

  # GET: /reviews/5
  get "/reviews/:id" do 
    erb :"/reviews/show.html"
  end

  # GET: /reviews/5/edit
  get "/reviews/:id/edit" do
    erb :"/reviews/edit.html"
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    # update review
    redirect "/reviews/:id"
  end

  #DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do 
    # delete the review
    # redirect to show/:show_id
    redirect :/
  end
end

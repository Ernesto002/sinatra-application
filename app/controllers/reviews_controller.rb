class ReviewsController < ApplicationController

  # POST: /reviews
  post "/reviews" do
    show = Show.find_by(id: params[:show_id])
    identical = !!show.reviews.detect { |review| review.content == params[:content] && review.user_id == session[:user_id]}
    redirect "/shows/#{params[:show_id]}?error=Invalid form submission, please try again:" if params.values.any?(&:empty?) || identical

    review = Review.create(content: params[:content], rating: params[:rating], show_id: params[:show_id], user_id: session[:user_id])
    redirect "/shows/#{review.show_id}"
  end

  get "/reviews/:id" do 
    erb :"/reviews/show.html"
  end

  get "/reviews/:id/edit" do
    @review = Review.find(params[:id])
    erb :"/reviews/edit.html"
  end

  patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(content: params[:content], rating: params[:rating])
    redirect "/reviews/:id"
  end

  #DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do 
    review = Review.find_by(id: params[:id])
    review.destroy if review.reviewer == current_user
    redirect back
  end
end

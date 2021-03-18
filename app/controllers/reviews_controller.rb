class ReviewsController < ApplicationController

  post '/reviews' do
    show = Show.find_by(id: params[:show_id])
    identical = !!show.reviews.detect { |review| review.content == params[:content] && review.user_id == current_user.id }
    redirect "/shows/#{params[:show_id]}?error=Invalid submission, please try again:" if params.values.any?(&:empty?) || identical
    review = Review.new(content: params[:content], rating: params[:rating])
    review.reviewer = current_user
    review.show = Show.find(params[:show_id])
    review.save
    redirect "/shows/#{review.show_id}"
  end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    redirect :login if @review.reviewer != current_user
    erb :'/reviews/edit.html'
  end

  patch '/reviews/:id' do
    review = Review.find(params[:id])
    if review.reviewer != current_user
      redirect "/shows/#{review.show_id}"
    end 
    review.update(content: params[:content], rating: params[:rating])
    redirect "/shows/#{review.show_id}"
  end

  delete '/reviews/:id/delete' do 
    review = Review.find_by(id: params[:id])
    review.destroy if review.reviewer == current_user
    redirect back
  end
end

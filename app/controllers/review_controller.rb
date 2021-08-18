# frozen_string_literal: true

# Review controller
class ReviewController < ApplicationController
  before_action :find_review, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index] # to show all the reviews created by the current user
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @title = 'All Reviews'

    @book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse
    @book_name = @book_info['volumeInfo']['title']
    @book_id = params[:book_id]

    # get all the book reviews
    @book_reviews = Review.where(gbook_id: @book_id)
  end

  def show
    @title = 'View Review'
  end

  def new
    @review = Review.new
    @title = 'New Review'
    @book_name = (HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse)['volumeInfo']['title']
  end

  def edit
    @title = 'Edit Review'
  end

  def create
    @review = Review.new(review_params)
    @review.gbook_id = params[:book_id]
    @review.author_id = current_user.id

    book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse
    book_name = book_info['volumeInfo']['title']

    @review.book_name = book_name

    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to view_path(book_id: params[:book_id])
    else
      flash[:alert] = 'Failed to create review.'
      redirect_to request.referrer
    end
  end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Review was successfully updated.'
      redirect_to view_path(book_id: @review.gbook_id)
    else
      flash[:alert] = 'Failed to update review.'
      redirect_to request.referrer
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = 'Review deleted successfully.'

    redirect_to view_path(book_id: @review.gbook_id)
  end

  def my_reviews
    @reviews = current_user.reviews
  end

  private

  def correct_user
    @review = current_user.reviews.find(params[:review_id])
    redirect_to review_path, notice: 'Not authorized to edit this review.' if @review.nil?
  end

  def find_review
    @review = Review.find(params[:review_id])
  end

  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end

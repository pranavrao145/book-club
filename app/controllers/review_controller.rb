class ReviewController < ApplicationController
  before_action :find_review, only: %i[show edit update destroy]
  before_action :authenticate_user!  # to show all the reviews created by the current user def index @reviews = Review.all end

  def index
    @title = 'All Reviews'

    @book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse
    @book_name = @book_info['volumeInfo']['title']

    # get all the book reviews
    @book_reviews = Review.where(gbook_id: params[:book_id])
  end

  def show
    @title = 'View Review'
    find_review
  end

  def new
    @review = Review.new
    @title = 'New Review'
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
    else
      flash[:alert] = 'Failed to create review.'
    end

    redirect_to view_path(book_id: params[:book_id])
  end

  def update
    if @review.update(params[:review])
      flash[:notice] = 'Review was successfully updated.'
    else
      flash[:alert] = 'Failed to update review.'
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = 'Review deleted successfully.'
  end

  def my_reviews
    @reviews = current_user.reviews
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end

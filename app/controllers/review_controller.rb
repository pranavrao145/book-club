class ReviewController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # to show all the reviews created by the current user 
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.gbook_id = params[:book_id]
    @review.author_id = current_user.id

    if @review.save
      flash[:notice] = 'Review was successfully created.'
    else
      flash[:alert] = 'Failed to create review.'
    end

  
    redirect_to view_path(book_id: params[:gbook_id])
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
  end

  def my_reviews
    @reviews = Review.where(author_id: current_user.id)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end

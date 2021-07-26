class ReviewController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]

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
    @review = Review.new(params[:review])

    if @review.save
      flash[:notice] = 'Review was successfully created.'
    else
      flash[:alert] = 'Failed to create review.'
    end
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
end

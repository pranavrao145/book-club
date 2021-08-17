# frozen_string_literal: true

# Discussion controller
class DiscussionController < ApplicationController
  before_action :find_discussion, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @title = 'All Discussions'

    @book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse
    @book_name = @book_info['volumeInfo']['title']
    @book_id = params[:book_id]

    # get all the book discussions
    @book_discussions = Discussion.where(gbook_id: @book_id)
  end

  def show
    @title = 'View Discussion'
  end

  def new
    @discussion = Discussion.new
    @title = 'New Discussion'
    @book_name = (HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse)['volumeInfo']['title']
  end

  def edit; end

  def create
    @discussion = Discussion.new(discussion_params)

    @discussion.gbook_id = params[:book_id]
    @discussion.author_id = current_user.id

    book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse
    book_name = book_info['volumeInfo']['title']

    @discussion.book_name = book_name

    if @discussion.save
      flash[:notice] = 'Discussion was successfully created.'
      redirect_to discussion_path(book_id: params[:book_id], id: @discussion.id)
    else
      flash[:alert] = 'Failed to create discussion.'
      redirect_to request.referrer
    end
  end

  def update
    if @discussion.update(discussion_params)
      flash[:notice] = 'Discussion was successfully updated.'
      redirect_to view_path(book_id: @discussion.gbook_id)
    else
      flash[:alert] = 'Failed to update discussion.'
      redirect_to request.referrer
    end
  end

  def destroy
    @discussion.destroy
    flash[:notice] = 'Discussion deleted successfully.'

    redirect_to view_path(book_id: @discussion.gbook_id)
  end

  private

  def find_discussion
    @discussion = Discussion.find(params[:id])
  end

  def correct_user
    @discussion = current_user.discussions.find(params[:id])
    redirect_to discussion_path, notice: 'Not authorized to edit this discussion.' if @discussion.nil?
  end

  def discussion_params
    params.require(:discussion).permit(:title, :content)
  end
end

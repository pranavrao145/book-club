# frozen_string_literal: true

# ReplyController
class ReplyController < ApplicationController
  before_action :find_reply, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show]
  before_action :correct_user, only: %i[edit update destroy]

  def show
    @title = 'View Reply'
  end

  def new
    @reply = Reply.new
    @title = 'New Reply'
    @book_name = (HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse)['volumeInfo']['title']
  end

  def edit
    @book_name = (HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse)['volumeInfo']['title']
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.discussion_id = params[:discussion_discussion_id]
    @reply.author_id = current_user.id

    if @reply.save
      flash[:notice] = 'Reply was successfully created.'
      redirect_to discussion_reply_path(book_id: params[:book_id], discussion_discussion_id: @reply.discussion_id,
                             reply_id: @reply.id)
    else
      flash[:alert] = 'Failed to create reply.'
      redirect_to request.referrer
    end
  end

  def update
    if @reply.update(reply_params)
      flash[:notice] = 'Reply was successfully updated.'
      redirect_to discussion_reply_path(book_id: params[:book_id], discussion_discussion_id: @reply.discussion_id,
                             reply_id: @reply.id)
    else
      flash[:alert] = 'Failed to update reply.'
      redirect_to request.referrer
    end
  end

  def destroy
    @reply.destroy
    flash[:notice] = 'Reply deleted successfully.'

    redirect_to view_path(book_id: @reply.discussion.gbook_id)
  end

  private

  def find_reply
    @reply = Reply.find(params[:reply_id])
  end

  def correct_user
    @reply = current_user.replies.find(params[:reply_id])
    redirect_to discussion_reply_path, notice: 'Not authorized to edit this reply.' if @reply.nil?
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end

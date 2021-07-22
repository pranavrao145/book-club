class BookController < ApplicationController
  def view
    @book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes?q=#{params[:book_id]}") # pull the book's info from the google api
  end

  def index
    @reviews = Review.all
  end
end

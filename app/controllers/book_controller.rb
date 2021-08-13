# frozen_string_literal: true

# Book controller
class BookController < ApplicationController
  def view
    # pull the book's info from the google api and turn it into json
    @book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse

    # get all the book reviews and calculate the average rating
    @book_reviews = Review.where(gbook_id: params[:book_id])

    if @book_reviews.empty?
      @average_rating = 0
    else
      total = 0

      @book_reviews.each do |book_review|
        total += book_review.rating
      end

      @average_rating = (total.to_f / @book_reviews.size).round(1)
    end
  end

  def search
    query_string = "https://www.googleapis.com/books/v1/volumes?q=#{params[:query]}"
    query_string_friendly = CGI.escape query_string
    @books = HTTP.get(query_string_friendly).parse
  end
end

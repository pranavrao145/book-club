# frozen_string_literal: true

class BookController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def view
    # pull the book's info from the google api and turn it into json
    @book_info = HTTP.get("https://www.googleapis.com/books/v1/volumes/#{params[:book_id]}").parse
  end
end

# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  # this method will decide wheter the user will be taken to home page or
  # search page as root
  def decide
    if user_signed_in?
      redirect_to home_path
    else
      redirect_to search_path
    end
  end

  def home
    @title = 'Home'

    # get the last 10 reviews
    @user_reviews = Review.where(author_id: current_user.id).last(10)
  end
end

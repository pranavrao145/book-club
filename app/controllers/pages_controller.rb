# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @title = 'Home'

    # get the last 10 reviews
    @user_reviews = Review.where(author_id: current_user.id).last(10)
  end
end

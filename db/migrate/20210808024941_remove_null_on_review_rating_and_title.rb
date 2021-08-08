class RemoveNullOnReviewRatingAndTitle < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reviews, :rating, false
    change_column_null :reviews, :title, false
  end
end

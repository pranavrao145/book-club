class RemoveNullOnReviewBookName < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reviews, :book_name, false
  end
end
